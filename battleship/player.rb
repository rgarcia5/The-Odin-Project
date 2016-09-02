class Player
  def initialize(name)
    @name = name
  end

  def get_play
    x_input = gets.chomp.to_i
    y_input = gets.chomp.to_i
    [x_input, y_input]
  end

end