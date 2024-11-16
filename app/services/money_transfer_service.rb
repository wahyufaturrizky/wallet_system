class MoneyTransferService
  def self.transfer(source_wallet:, target_wallet:, amount:)
    ActiveRecord::Base.transaction do
      Transaction.create!(transaction_type: 'transfer', source_wallet: source_wallet, target_wallet: target_wallet, amount: amount)
    end
  rescue => e
    Rails.logger.error("Transfer failed: #{e.message}")
    raise ActiveRecord::Rollback
  end
end
