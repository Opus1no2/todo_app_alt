# frozen_string_literal: true

class TodoList < ApplicationRecord
  has_many :todos, dependent: :destroy
  belongs_to :user

  validates :label, presence: true
  validates :user, presence: true
end
