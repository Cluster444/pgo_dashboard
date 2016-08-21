Rails.application.routes.draw do
  devise_for :users
  resources :pokemons, only: [:index]
  resources :poke_auths, only: [:index, :new, :create]
  get '/pokemons/csv', to: 'pokemons#csv'

  root to: redirect('/pokemons')
end
