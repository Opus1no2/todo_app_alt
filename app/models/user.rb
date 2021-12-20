# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :password, length: { in: 8..20 }
  validates :email, presence: true

  has_many :todo_lists, dependent: :destroy
  has_many :todos, through: :todo_lists

  after_create :create_default_list

  def create_default_list
    todo_list = TodoList.create!(label: 'Daily', user: self)
    Todo.create!(description: 'Get Started!', todo_list: todo_list)
  end
end
