class CreateWallets < ActiveRecord::Migration[7.2]
  def change
    create_table :wallets do |t|
      t.references :entity, polymorphic: true, null: false
      t.decimal :balance

      t.timestamps
    end
  end
end
