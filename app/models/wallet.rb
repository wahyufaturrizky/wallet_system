class Wallet < ApplicationRecord
  belongs_to :entity, polymorphic: true
  has_many :transactions, dependent: :destroy

  validates :balance, numericality: { greater_than_or_equal_to: 0 }, presence: true

  def credit(amount)
    update!(balance: balance + amount)
  end

  def debit(amount)
    raise "Insufficient funds" if balance < amount
    update!(balance: balance - amount)
  end
end
