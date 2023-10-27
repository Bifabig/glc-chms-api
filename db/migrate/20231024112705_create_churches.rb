class CreateChurches < ActiveRecord::Migration[7.0]
  def change
    create_table :churches do |t|
      t.string :name
      t.date :established_at
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
