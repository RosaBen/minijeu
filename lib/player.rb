class Player

  attr_accessor :name, :life_points

  def initialize(player_name)
    @life_points = 10
    @name = player_name
  end

  def show_state
    puts "#{@name} a #{life_points} points de vie" 
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