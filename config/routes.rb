Proposals::Application.routes.draw do
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:sessions] = 'sessions'
  devise_for :users, devise_config
  ActiveAdmin.routes(self)

  resources :proposals
  resources :users

  namespace :api do
    get '/rounds' => 'rounds#index'
    get '/rounds/:id' => 'rounds#show'
    get '/proposals' => 'proposals#index'
    get '/proposals/:id' => 'proposals#show'
    get '/votes' => 'votes#index'
    post '/votes' => 'votes#create'
    delete '/votes/:id' => 'votes#destroy'
    post '/hidden_votes' => 'hidden_votes#create'
    delete '/hidden_votes/:id' => 'hidden_votes#destroy'
    get '/results' => 'results#index'
  end

  # Ember app root
  scope :voting do
    get '/' => 'voting#index', as: :voting
    get '/*catchall' => 'voting#index'
  end

  match '/auth/:provider/callback' => 'sessions#create', via: %i(get post)
  match '/auth/failure' => 'sessions#failure', via: %i(get post)
  match '/logout' => 'sessions#destroy', via: %i(get delete), as: :logout

  root to: "pages#welcome"
end
