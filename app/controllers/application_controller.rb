class ApplicationController < ActionController::Base
  layout 'application'

  protect_from_forgery prepend: true
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
end
