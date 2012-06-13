class AddNameToUsersTable < ActiveRecord::Migration
  def up
    change_table(:users) do |t|
      t.string :rdio_name
    end
  end

  def down
  end
end
