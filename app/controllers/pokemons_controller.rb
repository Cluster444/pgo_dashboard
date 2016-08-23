class PokemonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @poke_auth = load_poke_auth
    render :no_poke_auths and return if @poke_auth.nil?
    render :no_pokemon and return if @poke_auth.pokemons.empty?
    @pokemons = @poke_auth.pokemons
  end

  def csv
    @pokemons = Pokemon.all
  end

private

  def load_poke_auth
    if current_user.has_multiple_accounts? and not params[:poke_auth_id].nil?
      PokeAuth.find(params[:poke_auth_id])
    else
      current_user.poke_auths.default
    end
  end
end
