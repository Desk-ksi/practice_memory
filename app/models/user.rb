class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:password] }
end
