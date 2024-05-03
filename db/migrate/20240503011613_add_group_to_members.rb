class AddGroupToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :group, :string
  end
end
