class CreateJoinTableProgramTeam < ActiveRecord::Migration[7.0]
  def change
    create_join_table :programs, :teams do |t|
      t.index [:program_id, :team_id]
      # t.index [:team_id, :program_id]
    end
  end
end
