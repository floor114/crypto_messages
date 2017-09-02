Rails.application.routes.draw do
  root to: 'home#index'

  resource :messages
end
