require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "validates password" do
      expect(described_class.new(email: "test@user.com", password: "a").valid?).to be false
    end
    it "validates email" do
      expect(described_class.new(password: 'validpassword').valid?).to be false
    end
  end
end
