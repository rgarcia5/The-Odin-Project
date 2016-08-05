require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'computer.rb'

class BattleshipGame

  attr_reader :player, :board

  def initialize(player, board)
    @player = player
    @board = board
  end

  def attack(spot)
    board[*spot] = :x
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def play_turn
    spot = player.get_play
    until valid_spot?(spot)
      spot = player.get_play
    end
    attack(spot)
  end




end