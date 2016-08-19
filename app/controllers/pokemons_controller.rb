class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all.sort_by {|p| [p.pokemon_id,p.stat_sum]}
  end
end
