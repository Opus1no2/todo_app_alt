require 'rails_helper'

RSpec.describe "TodoLists", type: :request do
  let(:user) { create(:user) }

  before do
    log_in(user)
  end

  describe "GET /index" do
    it "renders index" do
      get "/todo_lists"
      expect(response).to render_template(:index)
    end
  end
end
