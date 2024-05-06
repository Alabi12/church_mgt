class AddPaymentCategoryToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :payment_category, :integer
  end
end
