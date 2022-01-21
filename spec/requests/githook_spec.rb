# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Githook', type: :request do
  describe 'POST /hook' do
    it 'returns http ok' do
      post '/githook'
      expect(response).to have_http_status(:ok)
    end
  end
end
