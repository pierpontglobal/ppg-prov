class AddDescriptionToApp < ActiveRecord::Migration[6.0]
  def change
    add_column :apps, :description, :string
  end
end
