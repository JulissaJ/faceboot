class RemoveTitleFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :title, :string
  end

  def down
    add_column :posts, :title, :string
  end
end
