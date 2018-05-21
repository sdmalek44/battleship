require './lib/computer'
require './lib/player'
require './lib/text'
require './lib/input_check'

class Battleship
  def initialize
    @text = Text.new
    @computer = Computer.new
    @player = Player.new
  end

  def start_game
      puts @text.welcome
    loop do
      puts @text.intro
      break if @text.decision(@text.input)
    end
  end

  def place_computer_ships
    @computer.set_up_ships
    puts @text.computer_place_ships
  end

  def take_in_valid_ship
  end

  def place_two_ship
  end
end
