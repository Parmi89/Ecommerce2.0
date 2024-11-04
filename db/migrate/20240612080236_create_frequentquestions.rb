class CreateFrequentquestions < ActiveRecord::Migration[7.1]
  def change
    create_table :frequentquestions do |t|
      t.string :question, null: false
      t.text :answer, null: false

      t.timestamps
    end
  end
end
