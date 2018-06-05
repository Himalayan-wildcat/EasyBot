class HistoryController < ApplicationController

  def index
    @chats = Chat.order("created_at DESC").limit(10).select(:user_input, :bot_response, :created_at).as_json(except: :id)
    # to_json returns String.  as_json returns Hash with String keys.
    pretty_json @chats
  end

end
