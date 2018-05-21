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

  def player_fires
    @computer.board.display
    puts @text.enter_position
    entry = @text.input
    if @player.possible.include?(entry)
      @computer.board.shoot(entry)
      space = @computer.board.spaces[entry[0]][entry[1].to_i]
      if space.state == 'M'
        puts @text.miss(entry)
      elsif space.state == 'H'
        @computer.board.add_hit
        puts @text.hit(entry)
        space.show_sunk
        if space.state == 'X'
          puts @text.sunk_ship(space.ship.name)
          if winning_shot
            puts @text.winner
          end
        end
      end
      @player.remove_guess(entry)
      return
    else
      puts @text.cant_fire
      player_fires
    end
  end

  def winning_shot
    @computer.board.hits == 5
  end

  def end_turn
    puts @text.end_turn
    @text.input
  end

  def end_opposing_turn
    puts @text.end_opposing_turn
    @text.input
  end

  def computer_fires
    entry = @computer.possible.sample
    @player.board.shoot(entry)
    space = @player.board.spaces[entry[0]][entry[1].to_i]
    if space.state == 'M'
      puts @text.miss_comp(entry)
    elsif space.state == 'H'
      puts @text.hit_comp(entry)
      space.show_sunk
      if space.state == 'X'
        puts @text.comp_sunk(space.ship.name)
      end
    end
    @computer.remove_guess(entry)
    return
  end
end
