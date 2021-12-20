# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'validations' do
    it 'validates todo list' do
      expect(described_class.new(description: 'foo', todo_list_id: nil)).not_to be_valid
    end

    it 'validates description' do
      expect(described_class.new(description: '', todo_list_id: 1)).not_to be_valid
    end
  end
end
