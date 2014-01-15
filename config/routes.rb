Proposals::Application.routes.draw do
  root 'pages#welcome'

  resources :proposals
end
