class AddUserIdToPokemon < ActiveRecord::Migration[5.0]
  def change
    add_reference :pokemons, :user, foreign_key: true, type: :uuid
  end
end
