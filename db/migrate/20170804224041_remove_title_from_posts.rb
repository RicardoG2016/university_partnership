class RemoveTitleFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :group_id, :references
  end
end
