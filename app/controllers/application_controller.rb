class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	# Public Activity
	include PublicActivity::StoreController

	 # Mixpanel
	def mixpanel
		if Rails.env.production?
			@mixpanel ||= Mixpanel::Tracker.new('6f7401fff513f283c823508c697dc320')
		else
			@mixpanel ||= Mixpanel::Tracker.new('407b4a5f8dcca1db4c1dbb3c5240ee73')
		end
	end

end
