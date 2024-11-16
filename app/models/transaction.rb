class Transaction < ApplicationRecord
  belongs_to :source_wallet, class_name: 'Wallet', optional: true
  belongs_to :target_wallet, class_name: 'Wallet', optional: true

  validates :amount, numericality: { greater_than: 0 }, presence: true
  validates :transaction_type, inclusion: { in: %w[credit debit transfer] }

  after_create :process_transaction

  private

  def process_transaction
    if transaction_type == 'credit' && target_wallet
      target_wallet.credit(amount)
    elsif transaction_type == 'debit' && source_wallet
      source_wallet.debit(amount)
    elsif transaction_type == 'transfer' && source_wallet && target_wallet
      source_wallet.debit(amount)
      target_wallet.credit(amount)
    end
  end
end
