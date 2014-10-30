class PlayersController < ApplicationController
	before_action :set_player, only: [:show, :edit, :update, :destroy]

	def index
		@search = Player.search(params[:q])
		@players = @search.result.order("points desc").paginate(page: params[:page], per_page: 25)
	end

	def show
		@player = Player.find(params[:id])
		@player_towns = @player.towns.all.order("points desc").paginate(page: params[:page], per_page: 15)
	end

	# Follow / Unfollow --------------------------------------------------------------------------------

	def follow
		@player = Player.find(params[:id])
		current_user.follow(@player)
		# Mixpanel
		mixpanel.track(current_user.id, 'Followed a Player')
		mixpanel.people.plus_one(current_user.id, 'Following')
		# Google Event
		Gabba::Gabba.new("#{Settings.google_analytics}}", "grecqo.com").event("Player", "Follow", "ID", "#{current_user.id}", true)

		redirect_to :back, notice: 'Du folgst diesem spieler jetzt.'
	end

	def unfollow
		@player = Player.find(params[:id])
		current_user.stop_following(@player)
		# Delete Activities that have been created
		# PublicActivity::Activity.where(owner: @player, recipient: current_user).delete_all

		# Mixpanel
		mixpanel.track(current_user.id, 'Unfollowed a Player')
		mixpanel.people.increment(current_user.id, { 'Following' => -1 })
		# Google Event
		Gabba::Gabba.new("#{Settings.google_analytics}}", "grecqo.com").event("Player", "Unfollow", "ID", "#{current_user.id}", true)


		redirect_to :back, notice: 'Du folgst diesem spieler jetzt nicht mehr'
	end

	# --------------------------------------------------------------------------------------------------

	private
	def set_player
		@player = Player.find(params[:id])
	end
end
