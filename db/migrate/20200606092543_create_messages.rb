class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :image
      t.text :chat
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end


# |image|text||
# |chat|text||
# |user_id|integer|null: false, foreign_key: true|
# |group_id|integer|null: false, foreign_key: true|