class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons, id: :uuid do |t|
      t.integer :move_1
      t.integer :move_2
      t.integer :captured_cell_id
      t.integer :pokeball
      t.integer :pokemon_id
      t.integer :creation_time_ms
      t.float   :height_m
      t.integer :stamina_max
      t.float   :weight_kg
      t.integer :individual_defense
      t.integer :individual_stamina
      t.integer :individual_attack
      t.integer :cp
      t.integer :stamina
      t.float   :cp_multiplier
      t.integer :pgo_id
      t.integer :from_fort
      t.string  :nickname
      t.integer :battles_attacked
      t.timestamps
    end
  end
end
