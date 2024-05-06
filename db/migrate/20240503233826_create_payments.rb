class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :member, null: false, foreign_key: true
      t.string :payment_method

      t.timestamps
    end
  end
end
