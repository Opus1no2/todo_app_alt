require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user) }

  describe "POST /create" do
    context "valid email and password" do
      it "redirects to resource" do
        post "/session", params: { email: user.email, password: user.password }
        expect(response).to redirect_to(todo_lists_url)
      end
    end
  end

  describe "DELETE /destroy" do
    it "does nothing" do
      delete "/session"
      expect(response).to have_http_status(:ok)
    end
  end
end
