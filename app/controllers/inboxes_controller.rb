class InboxesController < ApplicationController
  before_action :set_inbox, only: %i[show edit update destroy]

  # GET /inboxes or /inboxes.json
  def index
    @inboxes = Inbox.all
  end

  # GET /inboxes/1 or /inboxes/1.json
  def show
  end

  def new
    @inbox = Inbox.new
  end

  def edit
  end

  def create
    @inbox = Inbox.new(inbox_params)
    @inbox.user = current_user

    respond_to do |format|
      if @inbox.save
        format.html { redirect_to inbox_url(@inbox), notice: t('.notice') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @inbox.update(inbox_params)
        format.html { redirect_to inbox_url(@inbox), notice: t('.notice') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inbox.destroy

    respond_to do |format|
      format.html { redirect_to inboxes_url, notice: t('.notice') }
    end
  end

  private

  def set_inbox
    @inbox = Inbox.find(params[:id])
  end

  def inbox_params
    params.require(:inbox).permit(:title, :description, :status)
  end
end
