Proposals::Application.routes.draw do
  resources :proposals

  match '/auth/:provider/callback' => 'sessions#create', via: %i(get post)
  match '/auth/failure' => 'sessions#failure', via: %i(get post)
  match '/logout' => 'sessions#destroy', via: %i(get delete), as: :logout

  root to: "sessions#new"
end
