Rails.application.routes.draw do
  get 'welcome/index'


	# root to: 'welcome#index'
  # devise_for :users, controllers: { sessions: "users/sessions", registration: "users/registrations" }
  devise_for :users, controllers: { registrations: "users/registrations" }
  Users::RegistrationsController
  resources :profiles
  root :to => redirect('/profiles/')
  # get 'logout' => 'users/sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
