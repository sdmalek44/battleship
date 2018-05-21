class Text
  def welcome
    "\nWelcome to BATTLESHIP\n"
  end

  def intro
    "\nWould you like to (p)lay, (i)nstructions, (q)uit?\n"
  end

  def bad_input
    "please enter a valid character\n"
  end

  def wrong_ship
    "please enter a valid ship placement"
  end

  def wrong_length
    "please enter a ship of the requested length"
  end

  def input
    print "> "
    gets.chomp.upcase
  end

  def instructions
    "\nINSTRUCTIONS: Each player calls out one shot (or coordinate) each
turn in attempt to hit one of their opponent’s ships. To hit one of your
opponent’s ships, you must enter a letter and a number of where you think
one of their ships is located. Once a shot is called, the opponent calls
out hit or miss. If one of your ships gets hit, it will be indicated by
the letter 'H' on the board. If calling a shot (or trying to hit your
opponent’s ships), a mark 'H' for hit and 'M' for miss will appear at
that spot. This will help you keep track of your hits and misses in your
hunt to find their ships. Once all spots on a ship have been filled with
an 'H', a ship has sunk and the 'H' markings on the board for that ship
will turn to 'S'. The first player to sink all the opponents ships wins.\n"
  end

  def quit_game
    "\nQuitting game!!\n"
  end

  def computer_place_ships
      "I have laid out my ships on the grid.
You now need to layout your two ships.
The first is two units long and the
second is three units long.
The grid has A1 at the top left and D4 at the bottom right."
  end

  def two_ship
    "\nEnter the squares for the two-unit ship:\n"
  end

  def three_ship
    "\nEnter the squares for the three-unit ship:\n"
  end

  def decision(input)
    if input == "P"
      return true
    elsif input == "I"
      puts instructions
    elsif input == "Q"
      puts quit_game
      exit
    else
      puts bad_input
    end
  end

end
