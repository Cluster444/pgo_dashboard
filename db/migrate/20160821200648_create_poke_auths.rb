class CreatePokeAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :poke_auths, id: :uuid do |t|
      t.string :auth_type
      t.string :login_name
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
