class AddCreditLimitToPools < ActiveRecord::Migration
  def change
  	add_column :pools, :credit_limit, :integer
  end
end
