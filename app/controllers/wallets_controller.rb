class WalletsController < ApplicationController
  def transfer
    source_wallet = Wallet.find(params[:source_wallet_id])
    target_wallet = Wallet.find(params[:target_wallet_id])
    amount = params[:amount].to_d

    MoneyTransferService.transfer(source_wallet: source_wallet, target_wallet: target_wallet, amount: amount)
    render json: { message: 'Transfer successful' }
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
