class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :firstName
      t.string :lastName
      t.string :profilePicture
      t.integer :highScore
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
