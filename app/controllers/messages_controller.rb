class MessagesController < ApplicationController

  before_action :authenticate_user

  def index
    messages = Message.all.order(:created_at => :desc)
    render json: messages
  end

  def create
    message = Message.new(
      user_id: current_user.id,
      body: params[:body]
    )
    if message.save
      ActionCable.server.broadcast "messages_channel", {
        id: message.id,
        name: message.user.name,
        body: message.body,
        created_at: message.created_at
      }
      render json: message
    else
      render json: {errors: message.errors.full_messages}, status: 422
    end
  end

end
