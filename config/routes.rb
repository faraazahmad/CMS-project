Rails.application.routes.draw do
  resources :edu_subsidies
  resources :elec_subsidies
  resources :lpg_subsidies
  get 'sessions/new'

  resources :citizens

  get  '/signup',  to: 'citizens#new'
  post '/signup',  to: 'citizens#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root to: 'site#index'

  get '/subsidies/lpg',     to: 'lpg_subsidies#index'
  get '/subsidies/elec',    to: 'elec_subsidies#index'
  get '/subsidies/edu',     to: 'edu_subsidies#index'
end
