class HumanPlayer
  
  def get_play
    move = gets.chomp
    move = move.split("").map(&:to_i)
  end
  
end
