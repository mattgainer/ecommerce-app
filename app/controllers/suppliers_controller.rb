class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end
  def new
  end
  def create
    Supplier.create(name: params[:name], email: params[:email], phone: params[:phone])
    redirect_to "/suppliers/#{Supplier.last.id}"
    flash[:success] = "Supplier Created"
  end
  def show
    @supplier = Supplier.find_by(id: params[:id].to_i)
  end
  def edit
    @supplier = Product.find_by(id: params[:id].to_i)
  end
  def update
    Supplier.update(name: params[:name], email: params[:email], phone: params[:phone])
    flash[:info] = "Supplier Updated"
    redirect_to = "/suppliers/#{Supplier.find_by(id: params[:id]).id}"
  end
  def destroy
    Supplier.find_by(id: params[:id]).destroy
    flash[:warning] = "Supplier Deleted"
    redirect_to "/suppliers"
  end
end
