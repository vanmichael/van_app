class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id

      t.timestamps
    end
  end
end
