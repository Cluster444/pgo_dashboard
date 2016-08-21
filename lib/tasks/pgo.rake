namespace :pgo do
  desc "Import a JSON dump of Pokemon data into database"
  task :import, [:file, :login_name] => :environment do |task, args|
    require 'json'
    require 'pp'
    file = File.read(Rails.root.join('tmp',args.file))
    json = JSON.parse(file)
    json.each do |pokemon|
      pokemon['pgo_id'] = pokemon['id']
      pokemon.delete('id')
    end
    json.reject!{|obj| obj.has_key? "is_egg"}
    account = PokeAuth.find_by(login_name: args.login_name)
    account.pokemons.create! json
  end

  desc "Import pokemon reference data"
  task :import_refs => :environment do |task, args|
    file = File.read(Rails.root.join('db','pokemon_refs.json'))
    json = JSON.parse file
    PokemonRef.create json
  end
end
