require './test/test_helper'
require './lib/text'

class TextTest < Minitest::Test
  def test_welcome
    t = Text.new

    expected = "\n\n\nWelcome to BATTLESHIP\n"
    assert_equal expected, t.welcome
  end

  def test_intro
    t = Text.new

    expected = "\nWould you like to (p)lay, (i)nstructions, (q)uit?\n"
    assert_equal expected, t.intro
  end

  def test_invalid
    t = Text.new

    expected = "\nInvalid input! Please enter a ships start and end coordinates.
For example: 'BLAH'\n"
    assert_equal expected, t.invalid('BLAH')
  end

  def test_bad_input
    t = Text.new

    expected = "please enter a valid character\n"

    assert_equal expected, t.bad_input
  end

  def test_not_three_ship
    t = Text.new

    expected = "\nC'mon now! Place a ship that is three spaces long and does not
land on top of another ship.\n"
    assert_equal expected, t.not_three_ship
  end

  def test_not_two_ship
    t = Text.new

    expected = "\nI said enter a ship that's two spaces long. Example: 'A1 A2'"
    assert_equal expected, t.not_two_ship
  end

  def instructions
    t = Text.new

    expected = "\nINSTRUCTIONS: Each player calls out one shot (or coordinate) each
turn in attempt to hit one of their opponent’s ships. To hit one of your
opponent’s ships, you must enter a letter and a number of where you think
one of their ships is located. Once a shot is called, the opponent calls
out hit or miss. If one of your ships gets hit, it will be indicated by
the letter 'H' on the board. If calling a shot (or trying to hit your
opponent’s ships), a mark 'H' for hit and 'M' for miss will appear at
that spot. This will help you keep track of your hits and misses in your
hunt to find their ships. Once all spots on a ship have been filled with
an 'H', a ship has sunk and the 'H' markings on the board for that ship
will turn to 'X's. The first player to sink all the opponents ships wins.\n"

  assert_equal expected, t.instructions
  end

  def test_quit_game
    t = Text.new

    assert_equal "\nQuitting game!!\n", t.quit_game
  end

  def test_computer_places_ships
    t = Text.new

    expected = "\nI have laid out my ships on the grid.
You now need to layout your two ships.
The first is two units long and the
second is three units long.
The grid has A1 at the top left and D4 at the bottom right.\n"

    assert_equal expected, t.computer_place_ships
  end

  def test_ship_placed_message
    t = Text.new

    assert_equal "\nShip has been placed\n", t.placed
  end

  def test_two_ship
    t = Text.new

    expected = "\nEnter the squares for the two-unit ship:\n"
    assert_equal expected, t.two_ship
  end

  def test_three_ship
    t = Text.new

    expected = "\nEnter the squares for the three-unit ship:\n"
    assert_equal expected, t.three_ship
  end

  def test_miss_message
    t = Text.new

    expected = "Your shot at BLAH was a miss..."
    assert_equal expected, t.miss('BLAH')
  end

  def test_hit_message
    t = Text.new

    expected = "Your shot at BLAH was a hit! Nice work captain!\n"

    assert_equal expected, t.hit('BLAH')
  end

  def test_decision
    t = Text.new

    assert t.decision('P')
  end

  def test_restart_prompt
    t = Text.new

    assert_equal "Enter 'r' to restart or 'q' to quit\n", t.restart_prompt
  end

  def test_enter_position
    t = Text.new

    expected = "\nEnter a position to fire on: "
    assert_equal expected, t.enter_position
  end

  def test_cant_fire
    t = Text.new

    expected = "You cant fire on that position!!!
Position either doesn't exist or you have already fired on it.\n"

    assert_equal expected, t.cant_fire
  end

  def test_computer_miss_message
    t = Text.new

    expected = "The computer fired at blah but missed..\n"
    assert_equal expected, t.miss_comp('blah')
  end

  def test_computer_hit_message
    t = Text.new

    expected = "The computer fired and hit your ship at BLAH!\n"
    assert_equal expected, t.hit_comp('BLAH')
  end

  def test_end_turn
    t = Text.new

    expected = "\nIf you would like to end your turn press ENTER"
    assert_equal expected, t.end_turn
  end

  def test_end_opposing_turn
    t = Text.new

    expected = "\nPress ENTER"
    assert_equal expected, t.end_opposing_turn
  end

  def test_sunk_ship
    t = Text.new

    expected = "\nYou have sunken the opponents blah!\n"
    assert_equal expected, t.sunk_ship('blah')
  end

  def test_computer_sunk
    t = Text.new

    expected = "\nYour opponent has sunken your blah!!\n"
    assert_equal expected, t.comp_sunk('blah')
  end

  def test_winner
    t = Text.new

    expected = "That was the last of your opponents ships..\n
Congratulations! YOU WON!!
And you did it in 1 turns, 2 minutes, and 3 seconds."
  assert_equal expected, t.winner([2, 3], 1)
  end

  def test_loser
    t = Text.new

    expected = "That was the last of your remaining ships.
Guess what?...YOU LOSE!\n"
  assert_equal expected, t.loser
  end
end
