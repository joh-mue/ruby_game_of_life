require 'model/cell'
require 'config'

class GridInitializer
  def self.create_grid
    X.times.each_with_index.map do |_, i|
      Y.times.each_with_index.map do |_, j|
        Cell.new(i, j, self.is_alive(i, j))
      end
    end
  end

  def self.is_alive(x, y)
    GLIDER.include?([x, y])
  end
end
