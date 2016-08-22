class PokeAuthsController < ApplicationController
  def index
    @poke_auths = current_user.poke_auths
  end

  def new
    @poke_auth = current_user.poke_auths.new
  end

  def create
    @poke_auth = current_user.poke_auths.new(poke_auth_params)
    if @poke_auth.save
      redirect_to poke_auths_path
    else
      render :new
    end
  end

  def perform_import
    @poke_auth = PokeAuth.find(params[:id])
    args = [@poke_auth.auth_type, @poke_auth.login_name, poke_auth_params[:location], poke_auth_params[:password]]
    ImportPokemonJob.perform_now args
    redirect_to pokemons_path
  end

  def import
    @poke_auth = PokeAuth.find(params[:id]) 
    render :new_import
  end

  def default
    @poke_auth = PokeAuth.find(params[:id])
    @poke_auth.default!
    redirect_to poke_auths_path
  end


  private
 
  def poke_auth_params
    params.require(:poke_auth).permit(:display_name, :auth_type, :login_name, :location, :password)
  end
end
