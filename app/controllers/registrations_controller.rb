class RegistrationsController < Devise::RegistrationsController

	# Creating an Account
	def create
		super # This calls Devise::RegistrationsController#create
		if resource.save
			# Create Mixpanel User Profile
			mixpanel.track(@user.id, 'Created Account', {
				'$email' => @user.email
			})
			mixpanel.people.set(@user.id, {
				'$email' => @user.email,
				'Following' => 0
			})
			# Slack Notification
			notifier = Slack::Notifier.new "https://hooks.slack.com/services/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",
				channel: '#notifier', username: 'GrecqoBot'
			notifier.ping "Yay, we have a new User Registration. Users: #{User.all.count}"
			# Google Event
			Gabba::Gabba.new("#{Settings.google_analytics}", "grecqo.com").event("User", "Register", "ID", "#{@user.id}", true)
		end
	end

	# Editing an Account
	def update
		account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

		# required for settings form to submit when password is left blank
		if account_update_params[:password].blank?
			account_update_params.delete("password")
			account_update_params.delete("password_confirmation")
		end

		@user = User.find(current_user.id)
		if @user.update_attributes(account_update_params)
			set_flash_message :notice, :updated
			sign_in @user, bypass: true

			# Mixpanel Update User Profile
			mixpanel.people.set(@user.id, {
				'$email' => @user.email
			})

			redirect_to after_update_path_for(@user)
		else
			render 'edit'
		end
	end

	# Deleting an Account
	def destroy
		# Delete Mixpanel Profile
		mixpanel.track(@user.id, 'Deleted Account')
		mixpanel.people.delete_user(@user.id)

		resource.destroy
		Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
		yield resource if block_given?
		respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
	end

	protected

	def after_update_path_for(resource)
		:back
	end

end