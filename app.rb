# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('José')
player2 = Player.new('Josiane')
puts '----------------------------------'
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
puts '----------------------------------'
while player1.life_points.positive? && player2.life_points.positive?
  puts "Passons à la phase d'attaque :"
  player2.attacks(player1)
  player1.attacks(player2)
  puts '----------------------------------'
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state
  puts '----------------------------------'
  break if player2.life_points <= 0 || player1.life_points <= 0
end

# binding.pry


# %( #{} ) =  " "
# %q( ) = ' '