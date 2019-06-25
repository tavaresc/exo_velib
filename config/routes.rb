Rails.application.routes.draw do
  resources :positions, only:[:new, :show]
  root 'positions#new'
end
