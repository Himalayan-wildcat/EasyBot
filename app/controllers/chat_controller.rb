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

        case Chat.last[:user_input]
        when "こんにちは","こんにちは。"
          @chat.update(bot_response: "こんにちは。", identifier: 1)
        when "今何時ですか？","今何時","何時？"
          @chat.update(bot_response: Time.now.to_s(:jp_time)+ "です。", identifier: 1)
        when "今日の東京の天気は？","今日の天気は？"
          @chat.update(bot_response: Chat.get_weather + "です。", identifier: 1)
        else
          @chat.update(bot_response: "認識できませんでした。もう一度お願いします。", identifier:0)
        end

        format.html { redirect_to root_path }
        format.json { render :index, status: :created, location: @chat }
      end
    end
  end

  private

    def chat_params
      params.permit(:user_input).merge(bot_response: "", identifier:0)
    end

end
