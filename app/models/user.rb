class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :trips, dependent: :destroy
  has_secure_password
  enum role: ["default", "admin"]
end
