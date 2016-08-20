class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def csv
    @pokemons = Pokemon.all
  end
end
