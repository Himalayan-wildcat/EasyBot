class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.text :user_input
      t.text :bot_response
      t.timestamps
    end
  end
end
