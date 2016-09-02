class Board

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  attr_reader :grid

  def initialize(grid = Board::default_grid)
    @grid = grid
  end

  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos,val)
    x,y = pos
    grid[x][y] = val  
  end

  def count
    result = 0
    grid.each do |row|
      row.each do |spot|
        result += 1 if spot == :s
      end
    end
    result
  end

  def empty?(spot = nil)
    if spot == nil
      self.full?
    else
      self[*spot].nil?
    end
  end

  def full?
    grid.all? do |row|
      row.all? do |spot|
        spot != nil
      end
    end  
  end

  def valid_spot?(spot)
    empty?(spot) || self[*spot] == :s
  end

  def random_spot
    num = grid.length
    x = rand(num)
    y = rand(num)
    [x,y]

  end

  def place_random_ship

    until empty?(random_spot)
      pos = random_spot
    end

    self[*pos] = :s

  end

  def won?
    count == 0 ? true : false
  end
end

