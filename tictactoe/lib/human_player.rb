class HumanPlayer
  
  attr_accessor :name, :mark
  attr_reader :board
 
  def initialize(name)
    @name = name
  end

  def get_move
    puts "where"
    move = gets.chomp.split(",").map(&:to_i)
  end
  
  def display(board)
    print board.grid
  end
  
end
