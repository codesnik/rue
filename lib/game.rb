class Game
  # use 0 as 10
  CONNECTIONS = {
    1 => [2, 4],
    2 => [1, 3, 4, 5],
    3 => [2, 6],
    4 => [1, 2, 7],
    5 => [2, 6, 8],
    6 => [3, 5, 8, 9],
    7 => [4, 8, 0],
    8 => [7, 5, 6],
    9 => [6],
    0 => [7]
  }

  def initialize(starting_position=nil)
    @vents = starting_position || [false] * 10
  end

  attr_accessor :vents

  def toggle(vent)
    @vents[vent] = !@vents[vent]
    CONNECTIONS[vent].each do |connected|
      @vents[connected] = !@vents[connected]
    end
  end

  # obviously there're only two correct answers
  def won?
    @vents.values_at(0, 7, 8, 6, 3).all? && @vents.values_at(1, 2, 4, 5, 9).none? ||
    @vents.values_at(0, 7, 4, 2, 3).all? && @vents.values_at(1, 5, 6, 8, 9).none?
  end

  def show
    game = <<-END
      1 - 2 - 3
      | / |   |
      4   5 - 6
      |   | / |
      7 - 8   9
      |
      0
    END
    @vents.each_with_index do |vent, index|
      game.sub!(' ' + index.to_s, " \e[32;1m#{index}\e[m") if vent
    end
    print game
  end

end
