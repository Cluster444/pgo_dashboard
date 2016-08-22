require 'json'

class ImportPokemonJob < ApplicationJob
  queue_as :default

  def perform(*args)
    system_call = "python #{Rails.root.join('vendor', 'pgoapi', 'pokecli.py')} -a #{args[0][0]} -u '#{args[0][1]}' -l '#{args[0][2]}' -p '#{args[0][3]}'| jq '.responses.GET_INVENTORY.inventory_delta.inventory_items[].inventory_item_data.pokemon_data | select(. != null)' | jq -s . > #{Rails.root.join('tmp',args[0][1])}"
    system(system_call)
    file = File.read(Rails.root.join('tmp',args[0][1]))
    json = JSON.parse(file)
    account = PokeAuth.find_by(login_name: args[0][1])
    json.each do |pokemon|
      pokemon['poke_auth_id'] = account.id 
      pokemon['pgo_id'] = pokemon['id']
      pokemon.delete('id')
    end
    json.reject!{|obj| obj.has_key? "is_egg"}
    account.pokemons.destroy_all
    account.pokemons.create! json  
  end
end
