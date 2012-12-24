class ChangeNameToScreenName < ActiveRecord::Migration
  def change
  	rename_column :users, :name, :screen_name
  end
end
