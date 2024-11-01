class AddAmountToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :amount, :integer, null: false
  end
end
