class Ship
  attr_reader :length,
              :health,
              :sunk

  def initialize(length)
    @sunk = false
    @health = length
    @length = length
  end

  def name
    if @length == 2
      "tugboat"
    elsif @length == 3
      "cruiser"
    end
  end

  def hit
    if @sunk == false
      @health -= 1
    end
    if @health == 0
      @sunk = true
    end
  end
end
