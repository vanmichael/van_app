class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
    	t.string :content
    	t.integer :user_id
      t.timestamps
    end
  end
end

