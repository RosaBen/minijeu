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
    if @life_points <= 0
      puts "le joueur #{@name} a été tué!"
    else
      @life_points -= damage
    end
  end

end