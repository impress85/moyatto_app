class ApplicationController < ActionController::Base
  before_action :authenticate_user! , except:[:index,:show]
  before_action :configure_parmitted_parameters, if: :devise_controller?

  private
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname])
  end

end
