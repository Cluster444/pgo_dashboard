class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons, id: :uuid do |t|
      t.integer :move_1
      t.integer :move_2
      t.numeric :captured_cell_id, scale: 0, precision: 20
      t.integer :pokeball
      t.integer :pokemon_id
      t.bigint  :creation_time_ms
      t.float   :height_m
      t.integer :stamina_max
      t.float   :weight_kg
      t.integer :individual_defense
      t.integer :individual_stamina
      t.integer :individual_attack
      t.integer :cp
      t.integer :stamina
      t.float   :additional_cp_multiplier
      t.float   :cp_multiplier
      t.numeric :pgo_id, scale: 0, precision: 20
      t.integer :num_upgrades
      t.integer :from_fort
      t.integer :favorite
      t.string  :nickname
      t.integer :battles_attacked
      t.timestamps
    end
  end
end
