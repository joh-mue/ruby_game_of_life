require 'use_cases/neighbor_finder'
require 'use_cases/cell_changer'

class GridChanger < Struct.new(:grid)
  def new_grid
    grid.map do |column|
      column.map do |cell|
        neighbors = NeighborFinder.new(grid, cell).neighbors
        CellChanger.new(cell, neighbors).new_cell
      end
    end
  end
end
