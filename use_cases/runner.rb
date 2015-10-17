require '../grid_drawer'
require 'grid_changer'
require '../config'

class Runner < Struct.new(:grid)
  def run
    loop do
      GridDrawer.new(grid).draw
      @grid = GridChanger.new(grid).new_grid
      sleep 1 / REFRESH_RATE
    end
  end
end
