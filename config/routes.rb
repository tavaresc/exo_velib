Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  #get 'stations/new'
  #get 'stations/show'
  resources :stations, only:[:new, :show]
  root 'stations#new'
end
