#!/usr/bin/env ruby
$LOAD_PATH << File.expand_path('../../lib', __FILE__)
require 'game'

puts "when you lose patience press control+C"
best_solution = nil

trap("SIGINT") do
  if best_solution
    puts "solution found:"
    puts best_solution.join(' ')
  else
    puts "no solution found before exit"
  end
  exit
end

try = 0
loop do
  game = Game.new
  solution = []
  try += 1
  loop do
    move = rand(10)
    solution << move
    game.toggle(move)
    break if game.won?
  end
  if best_solution.nil? || solution.size < best_solution.size
    puts "found solution in #{solution.size} moves (try ##{try})"
    best_solution = solution
  end
end

