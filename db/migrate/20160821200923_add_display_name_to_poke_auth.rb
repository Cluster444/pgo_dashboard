class AddDisplayNameToPokeAuth < ActiveRecord::Migration[5.0]
  def change
    add_column :poke_auths, :display_name, :string
  end
end
