class Cell
  attr_reader :x, :y
  attr_reader :is_alive

  def initialize(x, y, is_alive)
    @x, @y, @is_alive = x, y, is_alive
  end
end
