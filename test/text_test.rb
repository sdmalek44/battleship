require './lib/text'
require './test/test_helper'

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

  def test_decision_returns_true_if_player_wants_to_play
    t = Text.new

    assert t.decision('P')
  end
end
