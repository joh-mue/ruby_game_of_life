require '../model/cell'

class CellChanger < Struct.new(:cell, :neighbors)
  def new_cell
    if cell.is_alive
      if alive_neighbor_count == 2 || alive_neighbor_count == 3
        alive_cell
      else
        dead_cell
      end
    else
      if alive_neighbor_count == 3
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
