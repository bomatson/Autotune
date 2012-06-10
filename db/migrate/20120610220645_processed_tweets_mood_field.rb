class ProcessedTweetsMoodField < ActiveRecord::Migration
  def up
    change_table(:processed_tweets) do |t|
      t.string :moods
    end
  end

  def down
  end
end
