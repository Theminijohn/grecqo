class PlayersController < ApplicationController
	before_action :set_player, only: [:show, :edit, :update, :destroy]

	def index
		@players = Player.all
	end

	def show
		@player = Player.find(params[:id])
		@player_towns = @player.towns.all.order("points desc").paginate(page: params[:page], per_page: 10)
	end

	# Follow / Unfollow --------------------------------------------------------------------------------

	def follow
		@player = Player.find(params[:id])
		current_user.follow(@player)
		# Mixpanel
		mixpanel.track(current_user.id, 'Followed a Player')
		mixpanel.people.plus_one(current_user.id, 'Following')

		redirect_to :back, notice: 'You are now following this Player'
	end

	def unfollow
		@player = Player.find(params[:id])
		current_user.stop_following(@player)
		# Delete Activities that have been created
		# PublicActivity::Activity.where(owner: @player, recipient: current_user).delete_all

		# Mixpanel
		mixpanel.track(current_user.id, 'Unfollowed a Player')
		mixpanel.people.increment(current_user.id, { 'Following' => -1 })

		redirect_to :back, notice: 'You unfollowed this Player'
	end

	# --------------------------------------------------------------------------------------------------

	private
	def set_player
		@player = Player.find(params[:id])
	end
end
