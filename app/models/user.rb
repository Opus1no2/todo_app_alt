class User < ApplicationRecord
  has_secure_password

  validates :password, length: { in: 8..20 }
  validates :email, presence: true
end
