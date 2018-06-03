class AddResponseToChats < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :response, :text
  end
end
