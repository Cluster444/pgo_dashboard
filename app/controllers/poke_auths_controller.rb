class PokeAuthsController < ApplicationController
  def index
    @poke_auths = current_user.poke_auths
  end

  def new
  end
end
