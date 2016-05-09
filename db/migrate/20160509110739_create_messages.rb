class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :chat
      t.integer :sender_id
      t.integer :reciever_id
      t.integer :issue_id
      t.boolean :archived

      t.timestamps
    end
  end
end
