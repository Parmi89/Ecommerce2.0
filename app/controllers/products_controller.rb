class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :check_admin, only: [:create,:new, :edit, :update]
  include CheckAdmin
  
  def index
    @categories = Category.order(name: :asc).load_async
    @pagy, @products = pagy_countless(FindProducts.new.call(product_params_index), items: 12)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
    unless current_admin
      redirect_to products_path, alert: t('common.not_admin')
    end
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: t('.created') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: t('.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: t('.destroyed') }
    end
  end

  private
 
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :description, :photo, :category_id,:admin_id, :amount, photos: [])
    end

    def product_params_index
      params.permit(:query_text, :page, :category_id)
    end
end

