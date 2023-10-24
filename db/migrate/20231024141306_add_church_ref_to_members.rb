class AddChurchRefToMembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :members, :church, null: false, foreign_key: true
  end
end
