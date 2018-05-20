require './lib/ship'

class Space
  attr_accessor :ship,
                :state

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
      @ship.hit #this is where i left off
      @state = 'H'
    else
      @state = 'M'
    end
  end

end
