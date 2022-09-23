class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    include Pundit
    # before_action :configure_permitted_parameters, if: :devise_controller?
    # def configure_permitted_parameters
    #     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:second_name])
    #   end


    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back(fallback_location: root_path)
    end
end
