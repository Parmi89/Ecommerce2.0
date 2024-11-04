class CreateInfoUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :info_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :province
      t.string :street
      t.integer :number
      t.integer :cell
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
