class GridDrawer < Struct.new(:grid)
  def draw
    grid.each do |column|
      print '|'
      column.each do |cell|
        if cell.is_alive
          print ' █'
        else
          print '  '
        end
      end
      print " |\n"
    end
    puts '--' * ( X + 1 )
  end
end
