require './lib/board'

class Computer

  attr_reader :board,
              :possible

  def initialize
    @board = Board.new('OPPONENTS GRID:')
    @possible = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    @two_ships = [%w[B1 C1], %w[B3 C3], %w[D3 D4]]
    @three_ships = [%w[A1 A2 A3], %w[B2 C2 D2], %w[A4 B4 C4]]
  end

  def set_up_ships(two = @two_ships.sample, three = @three_ships.sample)
    [two, three].each {|ship| @board.place_ship(ship)}
  end

  def remove_guess(entry)
    @possible.delete(entry)
  end
end
