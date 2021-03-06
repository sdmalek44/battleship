require './lib/computer'
require './lib/player'
require './lib/text'
require './lib/check'

class Battleship

  attr_reader :player,
              :computer,
              :text,
              :end_game,
              :turns

  attr_accessor :start_time

  def initialize
    @end_game = false
    @text = Text.new
    @computer = Computer.new
    @player = Player.new
    @turns = 0
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
    place_two_ship_if_valid(input)
  end

  def place_two_ship_if_valid(input)
    if @player.chk.valid(input)
      set_two_ship(input)
    else
      puts @text.invalid('A1 A2')
      place_first_ship
    end
  end

  def set_two_ship(input)
    if @player.chk.two_ship(input)
      puts @text.placed
      @player.enter_two_ship(input)
    else
      puts @text.not_two_ship
      place_first_ship
    end
  end

  def place_second_ship
    puts @text.three_ship
    input = @text.input
    place_three_ship_if_valid(input)
  end

  def place_three_ship_if_valid(input)
    if @player.chk.valid(input)
      return set_three_ship(input)
    else
      puts @text.invalid('A1 A3')
      place_second_ship
    end
  end

  def set_three_ship(input)
    if @player.chk.three_ship(input) && @player.no_overlap(input)
      puts `clear`
      @player.enter_three_ship(input)
      @start_time = Time.now
    else
      puts @text.not_three_ship
      place_second_ship
    end
  end

  def player_fires
    puts @computer.board.display
    puts @text.enter_position
    entry = @text.input
    puts `clear`
    fire_if_possible(entry)
  end

  def fire_if_possible(entry)
    if @player.possible.include?(entry)
      fire_at_computer(entry)
    else
      puts @text.cant_fire
      player_fires
    end
  end

  def fire_at_computer(entry)
    add_turn
    @computer.board.shoot(entry)
    check_shot_result(entry)
    @player.remove_guess(entry)
  end

  def check_shot_result(entry)
    space = @computer.board.spaces[entry[0]][entry[1].to_i]
    if space.state == 'M'
      puts @text.miss(entry)
    elsif space.state == 'H'
      player_hit_sequence(entry, space)
    end
  end

  def player_hit_sequence(entry, space)
    @computer.board.add_hit
    space.show_sunk
    puts @text.hit(entry)
    if space.state == 'X'
      check_if_won(space)
    end
    space
  end

  def check_if_won(space)
    puts @text.sunk_ship(space.ship.name)
    if winning_shot
      puts @text.winner(finish_time, turns)
      puts @computer.board.display
      puts @text.restart_prompt
      entry = @text.input
      restart(entry)
    end
  end

  def computer_fires
    entry = @computer.possible.sample
    puts `clear`
    @player.board.shoot(entry)
    check_comp_shot_result(entry)
    @computer.remove_guess(entry)
  end

  def check_comp_shot_result(entry)
    space = @player.board.spaces[entry[0]][entry[1].to_i]
    if space.state == 'M'
      puts @text.miss_comp(entry)
    elsif space.state == 'H'
      @player.board.add_hit
      computer_check_if_sunk(entry, space)
    end
  end

  def computer_check_if_sunk(entry, space)
    space.show_sunk
    puts @text.hit_comp(entry)
    if space.state == 'X'
      check_if_lost(space)
    end
  end

  def check_if_lost(space)
    puts @text.comp_sunk(space.ship.name)
    if losing_shot
      puts @text.loser
      puts @player.board.display
      puts @text.restart_prompt
      entry = @text.input
      restart(entry)
    end
  end

  def restart(entry)
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
    print @text.end_turn
    @text.enter
    puts `clear`
  end

  def add_turn
    @turns += 1
  end

  def end_opposing_turn
    print @text.end_opposing_turn
    @text.enter
    puts `clear`
  end

  def finish_time(time = Time.now)
    seconds = (time - @start_time).to_i
    minutes = seconds / 60
    Array.new.push(minutes, (seconds - minutes * 60))
  end
end
