class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :user,           null: false, foreign_key: true
      t.datetime :started_playing,  null: false
      t.time :time_spent,           null: false
      t.integer :score_value,       null: false

      t.timestamps
    end
  end
end
