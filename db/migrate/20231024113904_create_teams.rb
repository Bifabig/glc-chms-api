class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :main_leader_name
      t.string :sub_leader_name
      t.references :user, null: false, foreign_key: true
      # t.references :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
