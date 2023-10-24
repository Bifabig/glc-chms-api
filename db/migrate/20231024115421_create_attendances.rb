class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :att_taker
      t.boolean :is_present
      t.references :user, null: false, foreign_key: true
      t.references :church, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
