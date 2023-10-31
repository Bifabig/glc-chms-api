class CreateJoinTableMemberTeam < ActiveRecord::Migration[7.0]
  def change
    create_join_table :members, :teams do |t|
      t.index [:member_id, :team_id]
      # t.index [:team_id, :member_id]
    end
  end
end
