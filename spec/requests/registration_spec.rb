# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registration', type: :request do
  let(:user) { create(:user) }

  describe 'GET /show' do
    it 'renders show' do
      get '/registration'
      expect(response).to render_template(:show)
    end
  end

  describe 'POST /create' do
    context 'with existing user' do
      it 'rendirects to show' do
        post '/registration', params: { email: user.email, password: user.password }
        expect(response).to redirect_to(registration_path)
      end
    end

    context 'with new credentials' do
      it 'creates a new session' do
        post '/registration', params: { email: 'test@test.com', password: 'password12345' }
        expect(response).to redirect_to(todo_list_todos_path(TodoList.last))
      end
    end
  end
end
