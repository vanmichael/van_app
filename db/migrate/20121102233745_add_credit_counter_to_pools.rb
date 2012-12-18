class AddCreditCounterToPools < ActiveRecord::Migration
  def change
  	add_column :pools, :credit_counter, :integer
  end
end
