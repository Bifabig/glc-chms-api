class AddProgramRefToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :program, null: false, foreign_key: true
  end
end
