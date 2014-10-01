Rails.application.routes.draw do

  root 'pages#home'

  # Devise
  devise_for :users, path: '',
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # Players
  resources :players

end
