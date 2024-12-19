class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :login, presence: true
  has_secure_password :password, validations: true
  has_many :wishes, dependent: :destroy
end
