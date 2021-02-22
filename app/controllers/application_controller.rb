class ApplicationController < ActionController::Base
	before_action :authenticate_user!, except: [:home]

	def current_hotel
		if current_user.hotels.any?
		  current_user.hotels.first
		else
		  return nil
		end
	end
end
