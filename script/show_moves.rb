#!/usr/bin/env ruby
$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require 'game'

if ARGV.empty? || ARGV[0]['h']
  puts "displaying game moves"
  puts "Usage: #{$0} 0 1 2 8 5 3"
  exit
end

game = Game.new
ARGV.each do |move|
  puts "toggling #{move}"
  game.toggle(move.to_i)
  game.show
  puts
end
puts "won!" if game.won?
