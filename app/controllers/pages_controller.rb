class PagesController < ApplicationController
  def home
  	@search = Player.search(params[:q])
		@players = @search.result.order("points desc").paginate(page: params[:page], per_page: 25)
  end
end
