Rails.application.routes.draw do
  devise_for :users
  resources :pokemons, only: [:index]
  resources :poke_auths, only: [:index, :new, :create] do
    member do
      get 'import', as: 'import'
      patch 'perform_import', as: 'perform_import'
      patch 'default'
    end
  end
  get '/pokemons/csv', to: 'pokemons#csv'

  root to: redirect('/pokemons')
end
