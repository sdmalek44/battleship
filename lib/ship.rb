class Ship
  attr_reader :length,
              :health,
              :name,
              :sunk

  def initialize(length)
    @sunk = false
    @health = length
    @length = length
    if @length == 2
      @name = "tugboat"
    elsif @length == 3
      @name = "cruiser"
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
