require 'rails_helper'

RSpec.describe "Todos", type: :request do
  let(:user) { create(:user) }

  before do
    log_in(user)
  end

  describe "GET /index" do
    it "returns http found" do
      expect(response).to have_http_status(:found)
    end
  end
end
