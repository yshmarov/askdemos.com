class Inboxes::MessagesController < ApplicationController
  before_action :set_inbox
  before_action :set_message, only: %i[destroy]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  def new
    @message = @inbox.messages.new
  end

  def create
    @message = @inbox.messages.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to inbox_messages_url(@inbox), notice: t('.notice') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to inbox_messages_url(@inbox), notice: t('.notice') }
    end
  end

  private

  def set_inbox
    @inbox = Inbox.find(params[:inbox_id])
  end

  def set_message
    @message = @inbox.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:body).merge(user: current_user)
  end
end
