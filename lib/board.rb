require './lib/space'
require './lib/ship'

class Board
  attr_accessor :spaces

  def initialize
    @spaces = { 'A' => {1=>Space.new, 2=>Space.new, 3=>Space.new, 4=>Space.new},
                'B' => {1=>Space.new, 2=>Space.new, 3=>Space.new, 4=>Space.new},
                'C' => {1=>Space.new, 2=>Space.new, 3=>Space.new, 4=>Space.new},
                'D' => {1=>Space.new, 2=>Space.new, 3=>Space.new, 4=>Space.new}
              }
  end

 #assumed to be a valid placement
 #takes in the array of positions from splitting input string
  def place_ship(position_array)
      numbers = get_numbers(position_array)
      letters = get_letters(position_array)
      new_ship = Ship.new(position_array.length)
      letters.each_with_index do |letter, index|
          @spaces[letter][numbers[index]].ship = new_ship
      end
  end


  def get_letters(spaces)
    spaces.map {|space| space[0]}
  end

  def get_numbers(spaces)
    spaces.map {|space| space[1].to_i}
  end

  def same_row?(spaces)
    all_same?(spaces.map { |space| space[0]})
  end

  def same_col?(spaces)
    all_same?(spaces.map { |space| space[1]})
  end
end
