class User < ApplicationRecord
  has_secure_password

  validates :password, length: { in: 8..20 }
  validates :email, presence: true

  has_many :todo_lists
  has_many :todos, through: :todo_lists
end
