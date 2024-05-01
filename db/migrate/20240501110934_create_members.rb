class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :contact_number
      t.text :address

      t.timestamps
    end
  end
end
