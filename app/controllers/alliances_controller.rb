class AlliancesController < ApplicationController

	def index
		@search = Alliance.search(params[:q])
		@alliances = @search.result.order("rank asc").paginate(page: params[:page], per_page: 25)
	end

	def show
	end
end
