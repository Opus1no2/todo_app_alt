# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserSettings', type: :request do
  let(:user) { create(:user) }

  before do
    log_in(user)
  end

  describe 'GET /show' do
    it 'renders show method' do
      get settings_path
      expect(response).to render_template(:show)
    end
  end

  describe 'PUT /update' do
    context 'with valid params' do
      it 'returns a success message' do
        put settings_path, params: { email: user.email, password: 'password12345' }
        expect(flash[:notice]).to eq('Settings updated!')
      end
    end

    context 'without valid params' do
      it 'returns error messages' do
        put settings_path, params: { email: user.email, password: 'a' }
        expect(flash[:alert]).to include('Password is too short (minimum is 8 characters)')
      end
    end
  end
end
