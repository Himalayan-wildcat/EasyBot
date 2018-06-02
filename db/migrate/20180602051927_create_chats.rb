class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.text :keyword

      t.timestamps
    end
  end
end
