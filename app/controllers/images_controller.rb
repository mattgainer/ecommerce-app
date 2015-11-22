class ImagesController < ApplicationController
  def index
    if params[:product] != nil
      @images = Image.where(product_id: params[:product])
    else
      @images = Image.all
    end
  end
  def new
    if params[:product] != nil
      @fruit_name = Product.find_by(id: params[:product]).name
    else
      @fruit_name = "fruit"
    end
  end
  def create
    product = Product.find_by(name: params[:product])
    if product == nil
      flash[:warning] = "No Product by That Name"
      redirect_to "/images/new"
    else
      Image.create(url: params[:url], product_id: product_id)
      redirect_to "/images/#{Image.last.id}"
      flash[:success] = "Image Created"
    end
  end
  def show
    @image = Image.find_by(id: params[:id].to_i)
  end
  def edit
    @image = Image.find_by(id: params[:id].to_i)
  end
  def update
    Image.update(name: params[:name], email: params[:email], phone: params[:phone])
    flash[:info] = "Image Updated"
    redirect_to = "/images/#{Image.find_by(id: params[:id]).id}"
  end
  def destroy
    Image.find_by(id: params[:id]).destroy
    flash[:warning] = "Image Deleted"
    redirect_to "/images"
  end
end
