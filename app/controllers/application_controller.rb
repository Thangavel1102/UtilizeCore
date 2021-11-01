class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/search", :alert => "Please try with admin login credentials"
  end

  def after_sign_up_path_for(user)
    users_path # replace with the path you want
  end

  def after_sign_in_path_for(resource)
    if current_user.user_type == "admin"
      parcels_path
    else current_user.user_type == "user"
      search_path
    end
  end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :user_type, address_attributes: [:address_line_one, :address_line_two,
                                                                       :city, :state, :country,
                                                                       :pincode, :mobile_number]])
  end
end
