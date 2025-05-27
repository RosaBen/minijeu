class Player

  attr_accessor :name, :life_points

  def initialize(player_name)
    @life_points = 10
    @name = player_name
  end

  def show_state
    puts "#{@name} a #{life_points} points de vie et une arme de niveau #{@weapon_level}" 
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "le joueur #{@name} a été tué!"
    end
  end

  def attacks(opponent)
    puts "#{@name} attaque #{opponent.name}"
    damage = compute_damage
    puts "#{opponent.name} a reçu #{damage} points de dommages"
    opponent.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(player_name)
    @life_points = 100
    @weapon_level = weapon_lvl
  end

  def search_weapon

  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end
end