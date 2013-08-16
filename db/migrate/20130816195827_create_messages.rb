class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :recipient_id
      t.integer :receiver_id
      t.text :message_text
      t.string :subject

      t.timestamps
		end
		add_index :messages, :receiver_id
  end
end
