class OrdersController < ApplicationController
  def index
    if !(Order.find_by(user_id: current_user.id, open: true))
      @order = Order.new(user_id: current_user.id)
      @order.save
      if params[:show]
        flash[:success] = "Order Completed"
        redirect_to "/orders/#{params[:show]}"
      else
        redirect_to "/products"
      end
    end
    if !current_user.admin?
      @orders = Order.where(user_id: current_user.id, open: false)
    else
      @orders = Order.all
    end
    @orders.order(:updated_at)
  end
  def new
  end
  def create
  end
  def show
    if params[:complete]
      @order = Order.find_by(id: params[:id])
      if @order.price_dollar_form(@order.running_total) != "$0.00"
        redirect_to "/orders?show=#{params[:id]}"
        @order.update(open: false, subtotal: @order.running_subtotal, tax: @order.running_tax, total: @order.running_total)
      else
        flash[:warning] = "No Items Yet In Cart"
        redirect_to "/orders/#{@order.id}"
      end
    end
    @order = Order.find_by(id: params[:id])
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
