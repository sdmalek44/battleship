require './lib/computer'
require './lib/player'
require './lib/text'
require './lib/check'

class Battleship

  attr_reader :player

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

  def place_first_ship
    puts @text.two_ship
    input = @text.input
    if @player.chk.valid(input)
      if @player.chk.two_ship(input)
        puts @text.placed
        return @player.enter_two_ship(input)
      else
        place_first_ship
      end
    else
      place_first_ship
    end
  end

  def place_second_ship
    puts @text.three_ship
    input = @text.input
    if @player.chk.valid(input)
      if @player.chk.three_ship(input) && @player.no_overlap(input)
        puts @text.placed
        return @player.enter_three_ship(input)
      else
        place_second_ship
      end
    else
      place_second_ship
    end
  end
end
