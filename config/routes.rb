Rails.application.routes.draw do
  resources :categories
  # get 'pots/', to: 'pots#index' # la petición sera resuleta por el controlador pots en su metodo index
  # get 'pots/new', to: 'pots#new', as: 'new_pots'
  # get 'pots/:id', to: 'pots#show', as: :pot
  # get 'pots/:id/edit', to: 'pots#edit', as: :edit_pot
  # patch 'pots/:id', to: 'pots#update'
  # post 'pots', to: 'pots#create'

  resources :pots do
    get 'search', on: :collection # Esta seria la ruta pots/search -> pots# search
    # Nueva ruta para el controlador comments
    resources :comments, only: [:create] do
    resources :votes, only: [:create] # se utiliza la ruta anidada para el tema de los votos
    end
    resources :votes, only: [:create]
  end


  root "main#welcome"
end
