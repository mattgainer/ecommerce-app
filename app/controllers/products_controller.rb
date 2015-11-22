class ProductsController < ApplicationController
  def index
    if params[:order] == "PHtoL"
      @products = Product.all.order(price: :desc)
    elsif params[:order] == "PLtoH"
      @products = Product.all.order(:price)
    else
      @products = Product.all.order(:name)
    end
    if params[:discount] == "true"
      @products = @products.where("price < ?", Product.discount )
    elsif params[:commit] == "Search"
      @products = @products.where(name: params[:search])
    end
  end
  def create
    if params[:instock][:in_stock] == "true"
      @in_stock = true
    else
      @in_stock = false
    end
    Product.create(name: params[:name], price: params[:price], image: params[:image], description: params[:description], instock: @in_stock)
    redirect_to "/products/#{Product.last.id}"
    flash[:success] = "Product Created"
  end
  def new
  end
  def show
    @product = Product.find_by(id: params[:id].to_i)
  end
  def edit
    @product = Product.find_by(id: params[:id].to_i)
  end
  def update
    if params[:instock][:in_stock] == "true"
      @in_stock = true
    else
      @in_stock = false
    end
        Product.find_by(id: params[:id]).update(name: params[:name], price: params[:price], image: params[:image], description: params[:description], instock: @in_stock)
        flash[:info] = "Product Updated"
        redirect_to "/products/#{Product.find_by(id: params[:id]).id}"
  end
  def destroy
    Product.find_by(id: params[:id]).destroy
    redirect_to "/products"
    flash[:warning] = "Product Deleted"
  end
end
