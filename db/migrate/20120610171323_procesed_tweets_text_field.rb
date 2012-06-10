class ProcesedTweetsTextField < ActiveRecord::Migration
  def up
    change_table(:processed_tweets) do |t|
      t.string :text
    end
  end

  def down
  end
end
