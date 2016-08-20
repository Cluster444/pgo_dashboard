class AddBattlesDefendedToPokemon < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemons, :battles_defended, :integer
  end
end
