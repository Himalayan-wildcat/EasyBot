class HistoryController < ApplicationController

  def index
    @chats = Chat.order("created_at DESC").limit(10).select(:id, :user_input, :bot_response, :created_at)
    pretty_json @chats
  end

end
