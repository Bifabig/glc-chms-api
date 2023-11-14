class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :name
      t.date :date
      t.references :church, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end

    create_table :attendances do |t|
      t.string :att_taker
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
