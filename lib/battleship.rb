require './lib/computer'
require './lib/player'
require './lib/text'
require './lib/check'

class Battleship

  attr_reader :player,
              :computer,
              :text,
              :end_game

  def initialize
    @end_game = false
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
      return set_two_ship(input)
    else
      place_first_ship
    end
  end

  def set_two_ship(input)
    if @player.chk.two_ship(input)
      puts @text.placed
      @player.enter_two_ship(input)
    else
      place_first_ship
    end
  end

  def place_second_ship
    puts @text.three_ship
    input = @text.input
    if @player.chk.valid(input)
      return set_three_ship(input)
    else
      place_second_ship
    end
  end

  def set_three_ship(input)
    if @player.chk.three_ship(input) && @player.no_overlap(input)
      puts @text.placed
      @player.enter_three_ship(input)
    else
      place_second_ship
    end
  end

  def player_fires
    shot_prompt
    entry = @text.input
    fire_if_possible(entry)
  end

  def fire_if_possible(entry)
    if @player.possible.include?(entry)
      fire_at_computer(entry)
      return
    else
      invalid_shot
    end
  end

  def fire_at_computer(entry)
    @computer.board.shoot(entry)
    check_shot_result(entry)
    @player.remove_guess(entry)
  end

  def invalid_shot
    puts @text.cant_fire
    player_fires
  end

  def shot_prompt
    @computer.board.display
    puts @text.enter_position
  end

  def check_shot_result(entry)
    space = @computer.board.spaces[entry[0]][entry[1].to_i]
    if space.state == 'M'
      puts @text.miss(entry)
    elsif space.state == 'H'
      hit_sequence(entry, space)
    end
  end

  def hit_sequence(entry, space)
    @computer.board.add_hit
    puts @text.hit(entry)
    space.show_sunk
    if space.state == 'X'
      check_if_won(space)
    end
  end

  def check_if_won(space)
    puts @text.sunk_ship(space.ship.name)
    if winning_shot
      puts @text.winner
      puts @computer.board.display
      restart
    end
  end

  def computer_fires
    entry = @computer.possible.sample
    @player.board.shoot(entry)
    space = @player.board.spaces[entry[0]][entry[1].to_i]
    if space.state == 'M'
      puts @text.miss_comp(entry)
    elsif space.state == 'H'
      @player.board.add_hit
      puts @text.hit_comp(entry)
      space.show_sunk
      if space.state == 'X'
        puts @text.comp_sunk(space.ship.name)
        if losing_shot
          puts @text.loser
          restart
        end
      end
    end
    @computer.remove_guess(entry)
    return
  end

  def restart
    puts @text.restart_prompt
    entry = @text.input
    if entry == 'R'
      @end_game = true
    elsif entry == 'Q'
      puts @text.quit_game
      exit
    else
      restart
    end
  end

  def winning_shot
    @computer.board.hits == 5
  end

  def losing_shot
    @player.board.hits == 5
  end

  def end_turn
    puts @text.end_turn
    @text.input
  end

  def end_opposing_turn
    puts @text.end_opposing_turn
    @text.input
  end
end
