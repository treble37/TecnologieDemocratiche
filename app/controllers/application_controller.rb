# general controller inherited by all the controllers
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation,
               :name, :last_name, :gender,
               :birthdate, :birthplace,
               :address, :city, :zip_code,
               :tax_code, :document, :payment_recipe, :payment_type,
               :accept_real_info, :accept_cookies, :accept_terms, :accept_privacy)
    end
  end
end
