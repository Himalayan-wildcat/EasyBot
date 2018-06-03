class HistoryController < ApplicationController
  def index
    @chats = Chat.order("created_at DESC").limit(10)
    render json: @chats
  end
end
