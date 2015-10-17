require 'active_support/core_ext/object/try'

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
    grid[cell.x - 1].try(:[], cell.y)
  end
end
