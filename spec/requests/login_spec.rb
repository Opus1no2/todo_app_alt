require 'rails_helper'

RSpec.describe "Logins", type: :request do
  describe "GET /show" do
    it "renders show" do
      get "/login"
      expect(response).to render_template(:show)
    end
  end
end
