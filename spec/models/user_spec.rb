# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates password' do
      expect(described_class.new(email: 'test@user.com', password: 'a')).not_to be_valid
    end

    it 'validates email' do
      expect(described_class.new(password: 'validpassword')).not_to be_valid
    end
  end
end
