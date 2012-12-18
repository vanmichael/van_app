class AddUserIdToIcons < ActiveRecord::Migration
  def change
  	add_column :icons, :user_id, :integer
  end
end
