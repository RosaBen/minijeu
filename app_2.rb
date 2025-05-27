require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

human1 = HumanPlayer.new("Rosa", 2)
ennemi1 = Player.new("José")
ennemi2 = Player.new("Josiane")
puts '----------------------------------'
while ennemi1.life_points.positive? || ennemi2.life_points.positive? && human1.life_points.positive?
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "attaquer un joueur en vue :"
  puts "0 - #{ennemi2} a #{ennemi2.life_points} points de vie"
  puts "1 - #{ennemi1} a #{ennemi2.life_points} points de vie"
  puts '----------------------------------'
  "\n"
  print ">"
  choice = gets.chomp
   if choice != "0" || choice != "1" || choice != "a" || choice != "s"
    puts "Entrez une clé valide (a ou s ou 0 ou 1) :"
    "\n"
    print ">   "
    choice = gets.chomp
puts '----------------------------------'
   elsif choice == "0"
    puts "Passons à la phase d'attaque :"
    human1.attacks(ennemi2)
    ennemi2.show_state
human1.show_state
puts '----------------------------------'
  elsif choice == "1"
  puts "Passons à la phase d'attaque :"
  human1.attacks(ennemi1)
  human1.show_state
ennemi1.show_state
puts '----------------------------------'
  elsif choice == "s"
    puts "chercher des pack de soins :"
    human1.search_health_pack
puts '----------------------------------'
    puts "changer d'armes :"
    human1.search_weapon
   end
puts '----------------------------------'
puts "Les autres joueurs t'attaquent !"

puts '----------------------------------'
break if ennemi2.life_points <= 0 || ennemi1.life_points <= 0 || human1.life_points <= 0
end
