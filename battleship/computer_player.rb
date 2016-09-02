
class ComputerPlayer
  
  attr_reader :board
  
  def initialize
    @board = Board.new
  end
  
  def get_play
    length = @board.grid.length
    row = rand(length)
    col = rand(length)
    until board[[row,col]] == nil 
      row = rand(length)
      col = rand(length)
    end
    [row,col]
  end
  
end
