class AddPokeAuthToPokemon < ActiveRecord::Migration[5.0]
  def change
    add_reference :pokemons, :poke_auth, foreign_key: true, type: :uuid
  end
end
