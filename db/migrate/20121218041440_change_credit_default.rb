class ChangeCreditDefault < ActiveRecord::Migration
  def change
  	change_column :users, :credit, :integer, :default => "0"
  end
end
