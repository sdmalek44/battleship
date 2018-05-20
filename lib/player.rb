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
    @ship_locations = []
    @ship_lengths = []
  end

#places ship if input is valid and returns string
#if invalid returns string saying so
#takes in input that is assumed not to be nil
  def enter_location(input)
    if InputCheck.new(input).valid? && dont_overlap(input) && right_order(input)
      ship = InputCheck.new(input).expand_if_valid
      @ship_locations << ship
      @ship_lengths << ship.length
      "selection accepted"
    else
      "Invaid input. Ship was not placed"
    end
    set_up_ships if @ship_lengths.length == 2
  end

  def right_order(input)
    if @ship_lengths.length == 0
      input.length == 2
    elsif @ship_lengths.length == 1
        input.length == 3
    end
  end

  def dont_overlap(input)
    if InputCheck.new(input).valid?
      ship = InputCheck.new(input).expand_if_valid
      ship.each do |loc|
        if @ship_locations.flatten.include?(loc)
          return false
        else
          return true
        end
      end
    end
  end

  def set_up_ships
    if @ship_locations.length == 2
      @ship_locations.each {|location| @board.place_ship(location)}
    end
  end
end
