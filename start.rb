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
  attr_reader :is_alive

  def initialize(x, y, is_alive)
    @x, @y, @is_alive = x, y
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

class CellChanger < Struct.new(:cell)

  def new_cell
    if cell.is_alive
      if alive_neighbor_count == 2 || alive_neighbor_count == 3
        alive_cell
      else
        dead_cell
      end
    else
      if alive_neighbour_count == 3
        alive_cell
      else
        dead_cell
      end
    end
  end

  private

  def alive_neighbor_count
    neighbors.count(&:is_alive)
  end

  def dead_cell
    Cell.new(cell.x, cell.y, false)
  end

  def alive_cell
    Cell.new(cell.x, cell.y, true)
  end
end

class GridChanger < Struct.new(:grid)
  def new_grid
    grid.map do |column|
      column.map do |cell|
        CellChanger.new(cell).new_cell
      end
    end
  end
end

grid = GridInitializer.create_grid

binding.pry
