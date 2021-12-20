# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Todos', type: :request do
  let(:user) { create(:user) }

  before do
    log_in(user)
  end

  describe 'GET /index' do
    it 'returns http ok' do
      get todo_list_todos_path(user.todo_lists.first, user.todos.first)
      expect(response).to have_http_status(:ok)
    end
  end
end
