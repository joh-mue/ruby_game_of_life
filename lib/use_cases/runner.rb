require 'view/grid_drawer'
require 'use_cases/grid_changer'
require 'use_cases/grid_initializer'
require 'config'

class Runner
  def self.run
    grid = GridInitializer.create_grid
    loop do
      GridDrawer.new(grid).draw
      grid = GridChanger.new(grid).new_grid
      sleep 1.0 / REFRESH_RATE
    end
  end
end
