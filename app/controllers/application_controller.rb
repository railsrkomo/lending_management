class ApplicationController < ActionController::Base
	include AuthenticationsHelper
	before_action :authentication_check

  private
	def authentication_check
		unless logged_in?
			redirect_to new_authentication_path
		end
	end
end
