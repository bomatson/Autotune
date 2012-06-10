class UserOauthFields < ActiveRecord::Migration
  def up
    change_table(:users) do |t|
      t.string :twitter_id
      t.string :twitter_name
      t.string :twitter_token
      t.string :twitter_secret
      t.string :rdio_id
      t.string :rdio_token
      t.string :rdio_secret
    end
  end

  def down
  end
end
