class FrequentquestionsController < ApplicationController
  before_action :authenticate_admin!, except: [:index]
  before_action :set_frequentquestion, only: %i[edit update destroy ]
  include CheckAdmin
  
  def index
    @frequentquestions = Frequentquestion.all
  end

  def new
    @frequentquestion = Frequentquestion.new
  end

  def edit
  end

  def create
    @frequentquestion = Frequentquestion.new(frequentquestion_params)

    respond_to do |format|
      if @frequentquestion.save
        format.html { redirect_to frequentquestions_url, notice:  t('.created') } 
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @frequentquestion.update(frequentquestion_params)
        format.html { redirect_to frequentquestions_url, notice: t('.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @frequentquestion.destroy!

    respond_to do |format|
      format.html { redirect_to frequentquestions_url, notice:  t('.destroyed') }
    end
  end

  private
    def set_frequentquestion
      @frequentquestion = Frequentquestion.find(params[:id])
    end

    def frequentquestion_params
      params.require(:frequentquestion).permit(:question, :answer)
    end
end
