class CreateUsersAppsJoinTable < ActiveRecord::Migration[6.0]
  def change

    # If you want to add an index for faster querying through this join:
    create_join_table :apps, :users do |t|
      t.index :app_id
      t.index :user_id
    end
  end
end
