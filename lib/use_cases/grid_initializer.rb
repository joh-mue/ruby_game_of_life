require 'model/cell'
require 'config'

class GridInitializer
  def self.create_grid
    Y.times.each_with_index.map do |_, i|
      X.times.each_with_index.map do |_, j|
        Cell.new(i, j, self.is_alive(i, j))
      end
    end
  end

  def self.is_alive(x, y)
    #GLIDER.include?([x, y]) || LIGHTWEIGHT_SPACESHIP.include?([x-15, y-35])
    random_truth
  end

  def self.random_truth
    rand >= 0.6
  end
end
