class AddMemberIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :member_id, :integer
  end
end
