# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :todo_list

  validates :todo_list, presence: true
  validates :description, presence: true

  after_create_commit { broadcast_prepend_to 'todos' }
end
