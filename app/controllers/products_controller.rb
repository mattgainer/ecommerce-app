class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def create
    Product.create(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description])
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
        Product.find_by(id: params[:id]).update(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description])
        flash[:info] = "Product Updated"
        redirect_to "/products/#{Product.find_by(id: params[:id]).id}"
  end
  def destroy
    Product.find_by(id: params[:id]).destroy
    redirect_to "/products"
    flash[:warning] = "Product Deleted"
  end
  def search
    @products = Product.where(name: params[:name])
  end
end
