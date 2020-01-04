class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :title
      t.string :logo
      t.string :location

      t.timestamps
    end
  end
end
