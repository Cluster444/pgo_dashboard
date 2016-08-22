class PokeAuth < ApplicationRecord
  belongs_to :user
  has_many :pokemons

  attr_accessor :location
  attr_accessor :password

  def self.default
    results = where(default: true)
    if results.any?
      results.first
    else
      first
    end
  end

  def default!
    PokeAuth.transaction do
      PokeAuth.where(user_id: user_id).update(default: false)
      update(default: true)
    end
  end
end
