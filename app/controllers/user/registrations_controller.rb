class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:address, :telephone, :places)
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation, :current_password, :address, :telephone, :places )
    end
  end
end
