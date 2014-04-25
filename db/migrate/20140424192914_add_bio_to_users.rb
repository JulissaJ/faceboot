class AddBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text, null: false
  end
end
