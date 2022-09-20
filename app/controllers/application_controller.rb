class ApplicationController < ActionController::Base
  # before_action :configure_devise_parameters, if: :devise_controller?

  # private
  # def configure_devise_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:phone], except: [:email])
  # end

  # protect_from_forgery with: :exception

  # protected

  # def authenticate_user!
  #   authenticate_user!
  #   unless current_user.type == 'admin'
  #     flash[:alert] = "Unauthorized Access!"
  #     redirect_to root_path
  #   end
  # end

  # def current_user
  #   return unless current_user&.type == 'super_admin'
  #   current_user
  # end
  protect_from_forgery

  def access_denied(exception)
    redirect_to admin_organizations_path, alert: exception.message
  end
end
