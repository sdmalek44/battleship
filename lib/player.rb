require './lib/board'
require './lib/ship'
require './lib/check'

class Player

  attr_reader :board,
              :possible,
              :ship_locations,
              :filled_spots,
              :chk

  def initialize
    @board = Board.new('YOUR GRID:')
    @possible = %w[A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4 D1 D2 D3 D4]
    @ship_locations = []
    @filled_spots = []
    @chk = Check.new
  end

  def enter_two_ship(input)
    if @chk.two_ship(input)
      @ship_locations << input.split(" ").sort
      @filled_spots = @ship_locations.flatten
      true
    else
      false
    end
  end

  def enter_three_ship(input)
    if @chk.three_ship(input)
      if no_overlap(input)
        @ship_locations << @chk.expand(input)
        @filled_spots = @ship_locations.flatten
        true
      end
    else
      false
    end
  end

  def set_up_ships
    if @ship_locations.length == 2
      @ship_locations.each {|location| @board.place_ship(location)}
    end
  end

  def no_overlap(input)
    @chk.expand(input).each do |point|
      return false if @filled_spots.include?(point)
    end
    true
  end

  def remove_guess(entry)
    @possible.delete(entry)
  end
end
