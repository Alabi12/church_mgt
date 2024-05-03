class CreateGenerationals < ActiveRecord::Migration[7.1]
  def change
    create_table :generationals do |t|
      t.string :name

      t.timestamps
    end
  end
end
