# frozen_string_literal: true

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
    return unless @life_points <= 0

    puts "le joueur #{@name} a été tué!"
  end

  def attacks(opponent)
    puts "#{@name} attaque #{opponent.name}"
    damage = compute_damage
    puts "#{opponent.name} a reçu #{damage} points de dommages"
    opponent.gets_damage(damage)
  end

  def compute_damage
    rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(human_name)
    @life_points = 100
    @weapon_level = weapon_lvl
  end

  def search_weapon
  dice = rand(1..6)
  @weapon_level = 1
  new_weapon_lvl = dice
  puts "Tu as trouvé une arme de niveau #{new_weapon_lvl}"
  if @weapon_level < new_weapon_lvl
    @weapon_level = new_weapon_lvl
    puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
  else
    puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
  end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "Tu n'as rien trouvé... "
    elsif  dice == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      
      if @life_points <=100 || @life_points > 20 
       diff_points = 100 - @life_points
       @life_points += diff_points
      elsif @life_points.positive? || @life_points <=20
        @life_points += 80
      else
        puts "vous ne pouvez plus jouer"
      end
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points <=100 || @life_points > 50 
        diff_points = 100 - @life_points
        @life_points += diff_points
       elsif @life_points.positive? || @life_points <=50
         @life_points += 50
       else
         puts "vous ne pouvez plus jouer"
       end
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end
end
