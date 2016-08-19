class CreatePokemonRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_refs, id: false do |t|
      t.integer :id, primary_key: true
      t.string :name
      t.integer :stamina
      t.integer :attack
      t.integer :defense

      t.timestamps
    end
  end
end
