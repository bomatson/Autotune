class ProcessedTweets < ActiveRecord::Migration
  def up
    create_table(:processed_tweets) do |t|
      t.integer :tweet_id,        null: false

    end
  end

  def down
  end
end
