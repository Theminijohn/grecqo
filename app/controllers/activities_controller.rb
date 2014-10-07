class ActivitiesController < ApplicationController

	before_action :authenticate_user!

	def index
		@activities = PublicActivity::Activity.where(recipient: current_user).order("created_at desc").paginate(page: params[:page], per_page: 30)
	end

	def delete_all
		PublicActivity::Activity.where(recipient: current_user).delete_all
		redirect_to :back
	end

end