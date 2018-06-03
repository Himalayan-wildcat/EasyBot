class ChatController < ApplicationController

  def index
    @chats = Chat.all

    respond_to do |format|
      format.html
      format.json { render json: @chats }
    end
  end

  def  create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save

        case @user_input = Chat.order("created_at").last[:keyword]
        when "こんにちは","こんにちは。"
          @bot_response = Chat.create(keyword: "こんにちは。", identifier: 1)
        when "今何時ですか？"
          @bot_response =  Chat.create(keyword: Time.now.to_s(:jp_time)+ "です。", identifier: 1)
        when "今日の東京の天気は？"
          @bot_response = Chat.create(keyword: Chat.get_weather + "です。", identifier: 1)
        else
          @bot_response = Chat.create(keyword: "認識出来ませんでした。もう一度お願いします。", identifier: 1)
        end

        format.html { redirect_to root_path }
        format.json { render :index, status: :created, location: @chat }
      end
    end
  end

  private

    def chat_params
      #merge identifier param of 0 for user input
      params.permit(:keyword).merge(identifier:0)
    end
end
