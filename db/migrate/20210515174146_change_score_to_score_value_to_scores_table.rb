class ChangeScoreToScoreValueToScoresTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :scores, :score, :score_value
  end
end
