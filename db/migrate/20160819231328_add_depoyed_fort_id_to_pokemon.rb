class AddDepoyedFortIdToPokemon < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemons, :deployed_fort_id, :string
  end
end
