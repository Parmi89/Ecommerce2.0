class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :email, null: false
      t.string :facebook, null: false
      t.string :instagram, null: false
      t.string :phone, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
