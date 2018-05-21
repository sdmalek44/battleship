require './lib/computer'
require './lib/player'
require './lib/text'
require './lib/check'

class Battleship

  attr_reader :player,
              :computer,
              :text

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

  def display_both_boards
    puts "YOU:"
    @player.board.display
    puts "\nCOMPUTER:"
    @computer.board.display
  end

  def fire_on_position
    puts @text.enter_position
    entry = @text.input
    if @player.possible.include?(entry)
      @computer.board.shoot(entry)
      if @computer.board.spaces[entry[0]][entry[1].to_i].state == 'M'
        puts @text.miss(entry)
      elsif @computer.board.spaces[entry[0]][entry[1].to_i].state == 'H'
        puts @text.hit(entry)
      end
      return @computer.remove_guess(entry)
    else
      puts @text.cant_fire
      fire_on_position
    end
  end

end
