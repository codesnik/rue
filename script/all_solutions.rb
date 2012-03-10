#!/usr/bin/env ruby
$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require 'game'

puts "all solutions to the game (not including permutations)"
(1..10).each do |moves_count|
  (0..9).to_a.combination(moves_count) do |vents|
    game = Game.new
    vents.each do |vent|
      game.toggle(vent)
    end

    if game.won?
      puts vents.join(' ')
      # vents.permutation do |all_vents|
      #   puts all_vents.join(' ')
      # end
    end
  end
end
