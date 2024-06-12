class FrequentquestionsController < ApplicationController
  before_action :authenticate_admin!, except: [:index]
  before_action :set_frequentquestion, only: %i[ show edit update destroy ]
  
  def index
    @frequentquestions = Frequentquestion.all
  end

  def show
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
        format.html { redirect_to frequentquestion_url(@frequentquestion), notice: "Frequentquestion was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @frequentquestion.update(frequentquestion_params)
        format.html { redirect_to frequentquestions_url, notice: "Frequentquestion was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @frequentquestion.destroy!

    respond_to do |format|
      format.html { redirect_to frequentquestions_url, notice: "Frequentquestion was successfully destroyed." }
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
