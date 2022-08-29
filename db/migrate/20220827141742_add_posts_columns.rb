class AddPostsColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :posts ,:description,:text
    change_column :posts ,:name, :heading
  end
end
