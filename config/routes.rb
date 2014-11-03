Rails.application.routes.draw do

	root 'pages#home'

	# API
	namespace :api, defaults: { format: :json } do  
		namespace :v1 do
			resources :players, only: [:index, :show]
			resources :alliances, only: [:index, :show]
			resources :conquers, only: [:index, :show]
			resources :towns, only: [:index, :show]
		end
	end

	# Devise
	devise_for :users, path: '',
		path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
		controllers: { registrations: 'registrations' }

	# Players
	resources :players, only: [:index, :show] do
		member do
			get :follow
			get :unfollow
		end
		resources :towns
	end

	# Alliances
	resources :alliances, only: [:index, :show]

	# Conquers
	resources :conquers, only: [:index, :show]

	# Towns
	resources :towns, only: [:index, :show]

	# Activities
	resources :activities
	get 'clear_activities' => 'activities#delete_all', as: :clear_activities

	# Grecqo Status
	resources :statuses

end
