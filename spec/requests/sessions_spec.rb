require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }

  describe "POST /create" do
    context "valid email and password" do
      it "redirects to resource" do
        post "/session", params: { email: user.email, password: user.password }

        todo_list = user.todo_lists.first
        todo = user.todo_lists.first.todos.first
        expect(response).to redirect_to(todo_list_todos_url(todo_list, todo))
      end
    end
  end

  describe "DELETE /destroy" do
    it "returns http found" do
      delete "/session"
      expect(response).to have_http_status(:found)
    end
  end
end
