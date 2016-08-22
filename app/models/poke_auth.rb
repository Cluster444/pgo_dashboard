class PokeAuth < ApplicationRecord
  belongs_to :user
  has_many :pokemons

  attr_accessor :location
  attr_accessor :password
end
