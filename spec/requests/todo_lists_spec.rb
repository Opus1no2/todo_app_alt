# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TodoLists', type: :request do
  let(:user) { create(:user) }

  before do
    log_in(user)
  end

  describe 'DELETE /destroy' do
    it 'destroys the list' do
      expect {
        delete todo_list_path(user.todo_lists.first), headers: turbo_stream_headers
      }.to change { TodoList.count }
    end
  end
end
