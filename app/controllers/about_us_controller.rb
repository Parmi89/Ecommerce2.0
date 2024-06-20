class AboutUsController < ApplicationController
  before_action :set_about_u, only: %i[ show edit update destroy ]
  before_action :check_admin, only: [:new, :create,:edit, :update, :destroy]
  include CheckAdmin


  def index
    @about_us = AboutU.all
  end

  def show
  end

  def new
    @about_u = AboutU.new
  end

  def edit
  end

  def create
    @about_u = AboutU.new(about_u_params)

    respond_to do |format|
      if @about_u.save
        format.html { redirect_to about_us_path, notice: t('.created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @about_u.update(about_u_params)
        format.html { redirect_to about_u_url(@about_u), notice: t('.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @about_u.destroy!

    respond_to do |format|
      format.html { redirect_to about_us_url, notice: t('.destroyed') }
    end
  end

  private
    def set_about_u
      @about_u = AboutU.find(params[:id])
    end

    def about_u_params
      params.require(:about_u).permit(:title, :body)
    end
end
