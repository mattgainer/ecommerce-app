class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :calculate_cart_count

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :first_name, :last_name, :password) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :first_name, :last_name, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :first_name, :last_name, :password, :password_confirmation, :current_password) }
  end

  private

  def authenticate_admin_or_supplier!
    redirect_to "/" unless current_user && current_user.role == "admin" || current_user.role == "supplier"
  end

  def authenticate_admin!
    redirect_to "/" unless current_user && current_user.admin?
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def no_sign_up!
    redirect_to "/users/sign_in"
  end
  def calculate_cart_count
    if current_user
      session[:cart_count] = current_user.orders.find_by(open: true).carted_products.where(removed: false).count if !session[:cart_count]
      @cart_count = session[:cart_count]
    end
  end

end
