require './lib/board'
require './lib/ship'
require './lib/input_check'

class Player

  attr_reader :board,
              :guesses,
              :ship_locations,
              :ship_lengths

  def initialize
    @board = Board.new
    @possible_guesses = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    @ship_locations = [] #array of arrays holding ship locations
    @ship_lengths = [] #array of ship lengths
  end

  def two_or_three(input)
  end

  def set_up_ships
    if @ship_locations.length == 2
      @ship_locations.each {|location| @board.place_ship(location)}
    end
  end
end
