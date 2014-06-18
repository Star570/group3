Group3::Application.routes.draw do

	namespace :account do
		resources :groups
		resources :posts
	end


	resources :groups do 
	  member do
		post :join
		post :quit
	  end
	  resources :posts
	end


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => 'groups#index', :id => 'welcome'
end
