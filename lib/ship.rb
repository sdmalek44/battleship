class Ship
  attr_reader :length,
              :health,
              :name

  def initialize(length)
    @health = length
    @length = length
    if @length == 2
      @name = "tugboat"
    elsif @length == 3
      @name = "cruiser"
    end
  end

  def hit
    @health -= 1
  end
end
