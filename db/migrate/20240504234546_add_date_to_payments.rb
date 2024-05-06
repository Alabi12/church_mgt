class AddDateToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :date, :date
  end
end
