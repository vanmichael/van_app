class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :sport_type
      t.string :image

      t.timestamps
    end
  end
end
