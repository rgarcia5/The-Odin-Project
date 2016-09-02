class Board
  
  attr_reader :grid

  def initialize( grid = Array.new(3) { Array.new(3) } )
    @grid = grid
  end
    
  def [](row,col)
    @grid[row][col]
  end

  def []=(row,col,mark)
    @grid[row][col] = mark
  end

  def place_mark(position, mark)
    row, col = position
    if empty?(position)
      self[*position] = mark
    else
      puts "pick another spot"
    end
  end

  def empty?(position)
    row, col = position
    if self[*position] == nil
      return true
    else
      return false
    end
  end
  
  def rows
    grid.map{ |row| row }
  end
  
  def columns
    grid.transpose
  end
  
  def diagonals
    [ 
      [ self[0,0], self[1,1], self[2,2] ] , 
      [ self[0,2], self[1,1], self[2,0] ] 
    ]
  end
  
  def winner
    rows.any? do |row|
      if row.all? { |mark| row[0] == mark && mark != nil}
        return row[0]
      end
    end
    
    columns.any? do |column|
      if column.all? { |mark| column[0] == mark && mark != nil }
        return column[0]
      end
      
    end
    
    diagonals.any? do |diagonal|
      if diagonal.all? { |mark| diagonal[0] == mark && mark != nil }
        return diagonal[0]
      end
    end
    nil
  end
  
  def over?
    return true if self.winner
    
    grid.each do |row|
      return false if row.include?(nil)
    end
    
    grid.all? do |row|
      row.all? do |spot|
        spot != nil
      end
    end
  end

end
