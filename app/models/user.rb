class User < ApplicationRecord
  has_secure_password

  enum role: { basic: 0, viewer: 1, admin: 2 }, _suffix: :role

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
