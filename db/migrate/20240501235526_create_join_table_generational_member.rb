class CreateJoinTableGenerationalMember < ActiveRecord::Migration[7.1]
  def change
    create_join_table :generationals, :members do |t|
      # t.index [:generational_id, :member_id]
      # t.index [:member_id, :generational_id]
    end
  end
end
