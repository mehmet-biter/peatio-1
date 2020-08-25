class CreateWithdrawLimits < ActiveRecord::Migration[5.2]
  def change
    create_table :withdraw_limits do |t|

      t.string :currency_id, limit: 20, default: 'any', null: false, index: true, foreign_key: true
      t.string :group, limit: 32, default: 'any', null: false, index: true
      t.string :kyc_level, limit: 32, default: 'any', null: false, index: true

      t.decimal :l24hour, precision: 32, scale: 16, default: 0, null: false
      t.decimal :l1month, precision: 32, scale: 16, default: 0, null: false

      t.timestamps

    end
    add_index :withdraw_limits, %i[currency_id group kyc_level], unique: true
  end
end