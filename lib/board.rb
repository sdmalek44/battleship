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

  def display
    puts "=========="
    puts ". 1 2 3 4"
    puts "A #{@spaces['A'][1].state} #{@spaces['A'][2].state} #{@spaces['A'][3].state} #{@spaces['A'][4].state}"
    puts "A #{@spaces['B'][1].state} #{@spaces['B'][2].state} #{@spaces['B'][3].state} #{@spaces['B'][4].state}"
    puts "A #{@spaces['C'][1].state} #{@spaces['C'][2].state} #{@spaces['C'][3].state} #{@spaces['C'][4].state}"
    puts "A #{@spaces['D'][1].state} #{@spaces['D'][2].state} #{@spaces['D'][3].state} #{@spaces['D'][4].state}"

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

  def fit_horz?(array)
    if array.length == 2
      get_numbers(array)[0] <= 3
    elsif array.length == 3
      get_numbers(array)[0] <= 2
    end
  end

  def fit_vert?(array)
    if array.length == 2
      letters.index(get_letters(array)[0]) <= 2
    elsif array.length == 3
      letters.index(get_letters(array)[0]) <= 1
    end
  end

  def get_letters(spaces)
    spaces.map {|space| space[0]}
  end

  def get_numbers(spaces)
    spaces.map {|space| space[1].to_i}
  end

  def letters
    ['A', 'B', 'C', 'D']
  end
end
