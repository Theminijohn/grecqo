class TownsController < ApplicationController
	
	# For modal in Player#Show
	def show
		@town = Town.find(params[:id])
		if request.xhr?
			render partial: 'modal'
		else
			render :show
		end
	end

end
