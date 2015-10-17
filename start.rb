require 'active_support/core_ext/object/try.rb'
require 'pry'

X = 10
Y = 10

class GridInitializer
  def self.create_grid
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

class NeighborFinder < Struct.new(:grid, :cell)
  def neighbors
    [
      topleft, top,
      topright, right,
      bottomright, bottom,
      bottomleft, left
    ].compact
  end

  private

  def topleft
    grid[cell.x - 1].try(:[], cell.y - 1)
  end

  def top
    grid[cell.x].try(:[], cell.y - 1)
  end

  def topright
    grid[cell.x + 1].try(:[], cell.y - 1)
  end

  def right
    grid[cell.x + 1].try(:[], cell.y)
  end

  def bottomright
    grid[cell.x + 1].try(:[], cell.y + 1)
  end

  def bottom
    grid[cell.x].try(:[], cell.y + 1)
  end

  def bottomleft
    grid[cell.x - 1].try(:[], cell.y + 1)
  end

  def left
    grid[cell.x - 1].try(:[], cell.y1)
  end
end

class CellChanger < Struct.new(:cell, :new_cell)

  def new_cell
    if cell.is_alive
      if alive_neighbor_count < 2
        Cell.new(cell.x, cell.y, )
      end
    end
  end

  private

  def alive_neighbor_count
    neighbors.count(&:is_alive)
  end
end
grid_a = GridInitializer.create_grid
grid_b = GridInitializer.create_grid

current_grid = grid_a
next_grid = grid_b

binding.pry
