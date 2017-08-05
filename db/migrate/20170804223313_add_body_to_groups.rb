class AddBodyToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :university, :string
    add_column :groups, :president, :string
    add_column :groups, :member_count, :integer
    add_column :groups, :phone, :string
  end
end
