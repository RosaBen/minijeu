require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



player1= Player.new("José")
player1.show_state
player1.gets_damage(2)
binding.pry