class CreateAboutUs < ActiveRecord::Migration[7.1]
  def change
    create_table :about_us do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
