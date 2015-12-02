class ProductsController < ApplicationController
  def index
    if !current_user.orders.find_by(open: true)
      redirect_to "/orders"
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
      @products = @products.where(name: params[:search])
    end
  end
  def create
    if params[:instock][:in_stock] == "true"
      @in_stock = true
    else
      @in_stock = false
    end
    supplier = Supplier.find_by(name: params[:supplier_name]) || Supplier.new
      @product = Product.new(name: params[:name], price: params[:price], description: params[:description], instock: @in_stock, user_id: current_user.id, supplier_id: supplier.id)
    if @product.save
      redirect_to "/products/#{Product.last.id}"
      flash[:success] = "Product Created"
    else
      render :new
    end
  end
  def new
    unless current_user.admin?
      redirect_to root_path
    end
    @product = Product.new
  end
  def show
    @product = Product.find_by(id: params[:id].to_i)
  end
  def edit
    unless current_user.admin?
      redirect_to root_path
    end
    @product = Product.find_by(id: params[:id].to_i)
  end
  def update
    if params[:instock][:in_stock] == "true"
      @in_stock = true
    else
      @in_stock = false
    end
    Product.find_by(id: params[:id]).update(name: params[:name], price: params[:price], description: params[:description], instock: @in_stock)
    flash[:info] = "Product Updated"
    redirect_to "/products/#{Product.find_by(id: params[:id]).id}"
  end
  def destroy
    Product.find_by(id: params[:id]).destroy
    redirect_to "/products"
    flash[:warning] = "Product Deleted"
  end
end
