class ApplicationController < ActionController::Base
  layout 'application'

  protect_from_forgery prepend: true
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
