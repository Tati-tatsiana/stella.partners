Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'projects', to: 'pages#projects'
  get 'team', to: 'pages#team'
  get 'clients', to: 'pages#clients'
  post 'team', to: 'team#create'
  post 'projects', to: 'projects#create'
  post 'clients', to: 'clients#create'
  post '', to: 'home#create'
end
