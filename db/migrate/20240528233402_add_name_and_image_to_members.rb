class AddNameAndImageToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :name, :string
    add_column :members, :image, :string
  end
end
