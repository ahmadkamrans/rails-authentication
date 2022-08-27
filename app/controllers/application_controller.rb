class ApplicationController < ActionController::Base
	protect_from_forgery prepend: true
	before_action :authenticate_user!

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
end
