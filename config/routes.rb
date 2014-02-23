WriteupApp::Application.routes.draw do
  resources :contents do
		collection { post :import } 
		resources :comments
	end
	resources :users

  resources :sessions, only: [:new, :create, :destroy]
  
	root 'static_pages#home'

  match '/home',     to: 'static_pages#home',      via: 'get'
  match '/help',     to: 'static_pages#help',      via: 'get'
	match '/signup',	 to: 'users#new',  via: 'get'
  match '/signin',   to: 'sessions#new',           via: 'get'
  match '/signout',  to: 'sessions#destroy',       via: 'delete'




end
