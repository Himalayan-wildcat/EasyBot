Rails.application.routes.draw do
  root 'chat#index'
  get  '/history/list', to: 'history#index'
  resources :chat, only: [:index, :create]
end
