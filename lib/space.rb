require './lib/ship'

class Space
  attr_accessor :ship,
                :state
  #see if i can make this attr_reader

  def initialize
    @state = "~"
    @ship = nil
  end

  def fill(ship)
    @ship = ship
  end

  def empty?
    @ship == nil
  end

  def shot
    if @ship != nil
      @ship.hit
      @state = 'H'
    else
      @state = 'M'
    end
  end

  def show_sunk
    if @ship != nil && @ship.sunk
        @state = 'X'
    end
  end
end
