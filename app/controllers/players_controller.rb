class PlayersController < ApplicationController
	before_action :set_player, only: [:show, :edit, :update, :destroy]

	def index
		@players = Player.all
	end

	def show
		@player = Player.find(params[:id])
	end

	private
	def set_player
		@player = Player.find(params[:id])
	end
end
