Rails.application.routes.draw do
  get 'pots/', to: 'pots#index' # la petición sera resuleta por el controlador pots en su metodo index
  get 'pots/new', to: 'pots#new', as: 'new_pots'
  get 'pots/:id', to: 'pots#show', as: :pot
  post 'pots', to: 'pots#create'
  root "main#welcome"
end
