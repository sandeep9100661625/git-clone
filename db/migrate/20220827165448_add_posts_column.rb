class AddPostsColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :name, :heading
  end
end
