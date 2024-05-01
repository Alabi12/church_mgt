class AddServiceGroupToMembers < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :service_group, :string
  end
end
