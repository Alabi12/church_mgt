class CreateJoinTableServiceMember < ActiveRecord::Migration[7.1]
  def change
    create_join_table :services, :members do |t|
      # t.index [:service_id, :member_id]
      # t.index [:member_id, :service_id]
    end
  end
end
