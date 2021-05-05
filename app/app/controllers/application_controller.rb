class ApplicationController < ActionController::Base

     protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?


     helper_method :is_admin!
     helper_method :is_moderator!

     def is_admin!
     	unless current_user&.admin
     		redirect_to root_path
     	end
     end

     def is_moderator!
     	unless current_user&.moderator
     		redirect_to root_path
     	end
     end



     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :bio)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :bio)}
          end


end
