class LikesCountToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :likees_count, :integer, :default => 0
  end
end
