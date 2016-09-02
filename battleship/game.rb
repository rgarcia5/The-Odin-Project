require_relative 'board'
require_relative 'player'
require_relative 'computer'

class BattleshipGame
  
  attr_reader :player, :board
  
  def initialize(player, board)
    @player = player
    @board = board
  end
  
  def attack(position)
    if board[position] == :s || board.empty?(position)
      board[position] = :x 
    else
      puts "You attacked here already! Pick another spot."
    end
  end
  
  def count
    board.count
  end
  
  def game_over?
    board.won?
  end
  
  def play_turn
    puts "Please input a move"
    move = player.get_play
    attack(move)
  end
  
  def empty_spots_available
    board.empty_spots_available
  end
  
  def display_status
    puts "Number of ships remaining: #{count}"
    puts "Empty spots available: #{empty_spots_available}"
    
  end
  
  def play
    board.populate_grid
    loop do 
      play_turn
      display_status
      if game_over?
        puts "You won!"
        break
      end    
    end
    
  end
  
end

