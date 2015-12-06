class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin!, only: [:create, :update, :destroy]
  def index
    if current_user
      if !current_user.orders.find_by(open: true)
        redirect_to "/orders"
      end
    end
    if params[:order] == "PHtoL"
      @products = Product.all.order(price: :desc)
    elsif params[:order] == "PLtoH"
      @products = Product.all.order(:price)
    elsif params[:category]
      @products = Category.find_by(id: params[:category].to_i).products
    else
      @products = Product.all.order(:name)
    end
    if params[:discount] == "true"
      @products = @products.where("price < ?", Product.discount )
    elsif params[:commit] == "Search"
      @products = @products.where("name LIKE ?", "%#{params[:search]}%")
    end
  end
  def create
      @product = Product.new(product_params)
      @product.attributes = {user_id: current_user.id}
    if @product.save
      redirect_to "/products/#{Product.last.id}"
      flash[:success] = "Product Created"
    else
      render :new
      flash[:warning] = "Product Not Created"
    end
  end
  def new
    @product = Product.new
    @product.images.build
  end
  def show
    @product = Product.find_by(id: params[:id])
  end
  def edit
    @product = Product.find_by(id: params[:id])
    @product.images.build
  end
  def update
    @product = Product.find_by(id: params[:id])
    if @product.update(product_params)
      flash[:info] = "Product Updated"
      redirect_to "/products/#{Product.find_by(id: params[:id]).id}"
    else
      flash[:warning] = "Product Not Updated"
      render :edit
    end
  end
  def destroy
    Product.find_by(id: params[:id]).destroy
    redirect_to "/products"
    flash[:warning] = "Product Deleted"
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :price, :description, :instock, :user_id, :supplier_id, images_attributes: [:url])
  end
end
