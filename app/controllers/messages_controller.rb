class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :check_admin, only: [:index,:edit, :update, :destroy]

  # GET /messages or /messages.json
  def index
    @messages = Message.order(state: :desc, created_at: :desc)
  end  

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: t('.created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to messages_path, notice: t('.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_path, notice: t('.destroyed') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:sender, :title, :body, :response_type, :state)
    end

    def check_admin
      unless current_admin 
        redirect_to products_path, alert: t('common.not_admin')
      end
    end  
end
