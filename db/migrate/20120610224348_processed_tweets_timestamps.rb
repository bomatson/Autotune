class ProcessedTweetsTimestamps < ActiveRecord::Migration
  def up
    change_table(:processed_tweets) do |t|
      t.time :created_at
    end
  end

  def down
  end
end
