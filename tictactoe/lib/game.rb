require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  
  attr_reader :board, :player_one, :player_two
  
  def initialize( player_one, player_two )
    @board = Board.new
    @player_one = player_one
    @player_two = player_two
    @current_player_idx = 0
  end
  
  def show_board
    self.board   
  end
  
  def players
    [ player_one, player_two ]
  end
  
  def player_mark
    { player_one => :X, player_two => :O}
  end
  
  def current_player
    players[@current_player_idx]
  end
  
  def other_player_idx
    1 - @current_player_idx
  end
  
  def switch_players!
    @current_player_idx = other_player_idx
  end
  
  def play_turn
    move = current_player.get_move
    board.place_mark(move,player_mark[current_player])
    self.switch_players!
  end
  
  def play
    until board.over?
      play_turn
    end
  end
  
end

