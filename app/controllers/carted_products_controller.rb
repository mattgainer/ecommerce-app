class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to root_path
  end
  def new
  end
  def create
    @carted_product = CartedProduct.new(product_id: params[:product_id].to_i, order_id: Order.find_by(user_id: current_user.id, open: true).id, quantity: params[:quantity])
    if @carted_product.save
      flash[:success] = "Added to Cart"
      session[:cart_count] += 1
      redirect_to root_path
    else
      @product = Product.find_by(id: params[:product_id].to_i)
      render template: "products/show"
    end
  end
  def destroy
  end
  def edit
  end
  def update
  end
  def show
    if params[:removefrom]
      CartedProduct.find_by(id: params[:id]).update(removed: true)
      session[:cart_count] -= 1
      redirect_to "/orders/#{params[:removefrom]}"
    else
      redirect_to root_path
    end
  end
end
