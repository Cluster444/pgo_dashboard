class AddDefaultToPokeAuth < ActiveRecord::Migration[5.0]
  def change
    add_column :poke_auths, :default, :boolean
  end
end
