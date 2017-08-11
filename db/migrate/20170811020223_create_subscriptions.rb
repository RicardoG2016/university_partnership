class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.integer :chat_id
      t.integer :group_id

      t.timestamps
    end
  end
end
