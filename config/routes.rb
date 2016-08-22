Rails.application.routes.draw do
  devise_for :users
  resources :pokemons, only: [:index]
  resources :poke_auths, only: [:index, :new, :create] do
    get 'import', as: 'import', on: :member
    patch 'perform_import', as: 'perform_import', on: :member
  end
  get '/pokemons/csv', to: 'pokemons#csv'

  root to: redirect('/pokemons')
end
