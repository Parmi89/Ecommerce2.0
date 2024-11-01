class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :sender, null: false
      t.string :title, null: false
      t.string :body
      t.string :response_type, null: false
      t.string :state, default: "pending"

      t.timestamps
    end
  end
end
