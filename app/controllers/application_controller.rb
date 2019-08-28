class ApplicationController < ActionController::Base

def after_sign_in_path_for(resource)
 	flash[:notice] = "signed in successfully"
    user_path(current_user.id)
end

def after_inactive_sign_up_path_for(resource)
	flash[:notice] = "Welcome! You have signed up successfully."
	user_path(current_user.id)
  end

before_action :configure_permitted_parameters, if: :devise_controller?

 protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
 end
end
