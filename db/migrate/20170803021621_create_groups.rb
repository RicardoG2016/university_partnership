class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :university
      t.string :email
      t.string :password
      t.string :phone
      t.string :president
      t.integer :member_count

      t.timestamps
    end
  end
end
