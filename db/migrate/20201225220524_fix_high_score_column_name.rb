class FixHighScoreColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :highScore, :highscore
  end
end
