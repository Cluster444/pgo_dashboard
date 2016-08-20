Rails.application.routes.draw do
  resources :pokemons, only: [:index]
  get '/pokemons/csv', to: 'pokemons#csv'
end
