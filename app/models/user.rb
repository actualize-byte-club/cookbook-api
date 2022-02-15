class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, length: { in: 2..25 }
  validates :password, length: { in: 8..20 }
  has_many :recipes
end
