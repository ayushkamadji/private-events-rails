Rails.application.routes.draw do
  root 'users#show'
  resources :users, except: [:index, :edit]

  get   '/sign_in', to: 'sessions#new'
  post  '/sign_in', to: 'sessions#create'

  get   '/sign_up', to: 'users#new'

  delete 'sign_out', to: 'sessions#destroy'
end
