require 'rails_helper'

RSpec.describe "TodoLists", type: :request do
  describe "GET /index" do
    it "does nothing" do
      get "/todo_lists"
      expect(response).to render_template(:index)
    end
  end
end
