class User < ApplicationRecord
  has_secure_password
  has_one :wallet, as: :entity, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  after_create :create_wallet
end
