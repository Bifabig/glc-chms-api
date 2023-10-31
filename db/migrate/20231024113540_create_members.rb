class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :photo
      t.string :address
      t.text :phone_number
      t.date :joined_at
      t.references :church, null: false, foreign_key: true

      t.timestamps
    end
  end
end
