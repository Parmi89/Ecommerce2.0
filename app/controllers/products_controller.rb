class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :check_admin, only: [:create,:new, :edit, :update]
  


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
      redirect_to products_path, alert: "Acceso no autorizado. Debes ser administrador para acceder a esta página."
    end
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
 
    def set_product
      @product = Product.find(params[:id])
    end

  
    def product_params
      params.require(:product).permit(:name, :price, :description, :photo, :category_id,:admin_id, photos: [])
    end

    def product_params_index
      params.permit(:query_text, :page, :category_id)
    end

  def check_admin
    unless current_admin 
      redirect_to products_path, alert: "Acceso no autorizado. Debes ser administrador para acceder a esta página."
    end
  end
end

