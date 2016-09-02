class ComputerPlayer
  
  attr_reader :board
  attr_accessor :mark, :name
  
  def initialize(name)
    @name = name
  end
  
  def display(board)
    @board = board
  end
  
  
  def get_move
    
    @board.rows.each_with_index do |row, row_idx|
      marks = row.compact
      if marks.length == 2 && marks.uniq.length == 1
        column_idx = row.index(nil)
        return [row_idx , column_idx]
      end
    end
  
    @board.columns.each_with_index do |column, column_idx|
      marks = column.compact
      if marks.length == 2 && marks.uniq.length == 1
        row_idx = column.index(nil)
        return [row_idx, column_idx]
      end
    end

    @board.diagonals.each do |diagonal|
      marks = diagonal.compact
      if marks.length == 2 && marks.uniq.length == 1
        row_idx = diagonal.index(nil)
        left_diag_column_idx = row_idx
        right_diag_column_idx = 2 - row_idx
        
        if diagonal[ right_diag_column_idx ] == nil
          return [row_idx, right_diag_column_idx]
        end
        
        return [row_idx, left_diag_column_idx]
      end
    end
    
    @board.rows.shuffle.each_with_index do |row, row_idx|
      if row.include?(nil)
        column_idx = row.index(nil)
        return [row_idx, column_idx]
      end
    end
    
  end
  
end
