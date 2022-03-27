class HomeController < ApplicationController
  def home
  	@show_image = true
  	if user_signed_in?
  		redirect_to new_order_path
  	end                  
  end
end
