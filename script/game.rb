#!/usr/bin/env ruby
$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require 'game'

game = Game.new
game.show
print "next move? ('r' to reset, 'q' to exit) "

while move = gets do
  case move.chomp
  when 'q'
    exit
  when 'r'
    game = Game.new
  else
    game.toggle(move.to_i)
  end

  game.show
  if game.won?
    puts 'won!'
    exit
  end
  print "next move? ('r' to reset, 'q' to exit) "
end
