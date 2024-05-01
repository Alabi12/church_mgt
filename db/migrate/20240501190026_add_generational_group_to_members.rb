class AddGenerationalGroupToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :generational_group, :string
  end
end
