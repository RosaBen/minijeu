require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



player1= Player.new("José")
player2= Player.new("Josiane")
puts "----------------------------------"
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
puts "----------------------------------"
while player1.life_points > 0 && player2.life_points > 0
puts "Passons à la phase d'attaque :"
player2.attacks(player1)
player1.attacks(player2)
puts "----------------------------------"
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
puts "----------------------------------"
if player2.life_points <=0 || player1.life_points <=0 then
  break

end
end


binding.pry