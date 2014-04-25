class AddBootcampToUser < ActiveRecord::Migration
  def change
    add_column :users, :bootcamp, :string, null: false
  end
end
