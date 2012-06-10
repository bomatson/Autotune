class ProcesedTweetsAttributes < ActiveRecord::Migration
  def up
    change_table(:processed_tweets) do |t|
      t.string :embed_url
      t.string :from_user
      t.string :from_user_name
      t.string :to_user
      t.string :to_user_name
      t.timestamp
    end
  end

  def down
  end
end
