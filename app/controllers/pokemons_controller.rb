class PokemonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pokemons = Pokemon.all
    if @pokemons.any?
      render :index
    else
      render :no_pokemon
    end
  end

  def csv
    @pokemons = Pokemon.all
  end
end
