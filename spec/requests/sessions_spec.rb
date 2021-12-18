require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /create" do
    it "does nothing" do
      post "/session"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /destroy" do
    it "does nothing" do
      delete "/session"
      expect(response).to have_http_status(:ok)
    end
  end
end
