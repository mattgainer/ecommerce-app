class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def create
    Product.create(name: params[:name], price: params[:price].to_i, image: params[:image], description: params[:description])
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
  end
  def destroy
    Product.find_by(id: params[:id]).destroy
  end

end
