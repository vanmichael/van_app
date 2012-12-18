class AddUserCreditsToPools < ActiveRecord::Migration
  def change
  	add_column :pools, :user_credits, :integer
  end
end
