class Pokemon < ApplicationRecord
  def defense
    individual_defense || 0
  end

  def attack
    individual_attack || 0
  end

  def stamina
    individual_stamina || 0
  end

  def stat_sum
    defense + attack + stamina
  end
end
