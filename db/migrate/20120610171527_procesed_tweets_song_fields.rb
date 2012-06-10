class ProcesedTweetsSongFields < ActiveRecord::Migration
  def up
    change_table(:processed_tweets) do |t|
      t.string :track
      t.string :album
      t.string :artist
    end
  end

  def down
  end
end
