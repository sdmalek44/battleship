class Text
  def intro
    "Welcome to BATTLESHIP\n
Would you like to (p)lay, (i)nstructions, (q)uit?"
  end

  def input
    print ">"
    text = gets.chomp
    text.upcase if !text.nil?
  end

  def instructions
    "\nINSTRUCTIONS: Each player calls out one shot (or coordinate) each
turn in attempt to hit one of their opponent’s ships. To hit one of your
opponent’s ships, you must enter a letter and a number of where you think
one of their ships is located. The instructions state that once a shot is
called, the opponent calls out hit or miss. If one of your ships gets hit,
it will be indicated by the letter 'H' on the board. If calling a shot (or
trying to hit your opponent’s ships), a mark 'H' for hit and 'M' for miss
will appear at that spot. This will help you keep track of your hits and
misses in your hunt to find their ships. Once all spots on a ship have been
filled with an 'H', your ship has sunk and you will be prompted so.\n"
  end

  def quit_game
    "\nQuitting game!!\n"
  end

  def decision(input)
    if input == "P"
      puts "start new game"
    elsif input == "I"
      puts instructions
    else input == "Q"
      puts quit_game
      exit
    end
  end

end
