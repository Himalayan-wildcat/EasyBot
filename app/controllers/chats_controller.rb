class ChatsController < ApplicationController
  # before_action :set_chat, only: [:show, :edit, :update, :destroy]

  def index
    # @chat = Chat.new
    @chats = Chat.all

    respond_to do |format|
      format.html
      format.json { render json: @chats }
    end
  end

  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.html { redirect_to root_path }
        format.json { render :index, status: :created, location: @chat }
      else
        format.html { render :index }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # def set_chat
    #   @chat = Chat.find(params[:id])
    # end

    def chat_params
      params.permit(:keyword)
    end
end
