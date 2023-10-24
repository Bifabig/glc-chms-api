class AddProgramRefToMembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :members, :program, null: false, foreign_key: true
  end
end
