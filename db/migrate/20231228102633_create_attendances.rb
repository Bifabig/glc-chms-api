class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :member_name
      t.string :status
      t.string :remark
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
