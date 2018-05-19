require './lib/ship'

class Space
  attr_accessor :ship

  def initialize
    @ship = nil
  end

  def fill(ship)
    @ship = ship
  end

  def empty?
    @ship == nil
  end
end
