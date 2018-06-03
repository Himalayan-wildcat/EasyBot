class AddIdentifierToChat < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :identifier, :integer
  end
end
