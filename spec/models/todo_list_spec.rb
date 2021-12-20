# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoList, type: :model do
  describe 'validations' do
    it 'validates label' do
      expect(described_class.new(label: nil)).not_to be_valid
    end
  end
end
