class TodoList < ApplicationRecord
  has_many :todos
  belongs_to :user

  validates :label, presence: true
  validates :user, presence: true
end
