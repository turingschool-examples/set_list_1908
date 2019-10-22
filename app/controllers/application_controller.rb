class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :cart

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user

  end

  def current_admin?
    current_user && current_user.admin?
  end

end
