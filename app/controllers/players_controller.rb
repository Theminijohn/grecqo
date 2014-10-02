class PlayersController < ApplicationController
	before_action :set_player, only: [:show, :edit, :update, :destroy]

	def index
		@players = Player.all
	end

	def show
		@player = Player.find(params[:id])
		@player_towns = @player.towns.all.order("points desc").paginate(page: params[:page], per_page: 10)
	end

	private
	def set_player
		@player = Player.find(params[:id])
	end
end
