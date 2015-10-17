require 'pry'

X = 10
Y = 10

class GridInitializer
  def create_grid
    X.times.each_with_index.map do |_, i|
      Y.times.each_with_index.map do |_, j|
        Cell.new(i, j)
      end
    end
  end
end

class Cell
  attr_reader :x, :y
  attr_accessor :is_alive

  def initialize(x, y)
    @x, @y = x, y
  end
end

grid_a = nil
grid_b = nil

current_grid = grid_a
next_grid = grid_b

binding.pry
