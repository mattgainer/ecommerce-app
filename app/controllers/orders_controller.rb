class OrdersController < ApplicationController
  def index
  end
  def new
  end
  def create
    order = Order.create(product_id: params[:product_id].to_i, user_id: current_user.id, quantity: params[:quantity])
    order.add_totals
    redirect_to "/orders/#{order.id}"
  end
  def show
    @order = Order.find_by(id: params[:id])
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
