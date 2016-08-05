class Code
  
  attr_reader :pegs
  

  
  PEGS = 
    { 
      :Red => "R", :Green => "G", :Blue => "B", :Yellow => "Y",
      :Orange => "O", :Purple => "P"
    }
  
  def self.parse(input)
    
    input.split("").each do |color|
      unless PEGS.values.include?(color.upcase)  
        raise "Not a valid input."
      end
    end
    
    colors = input.split("")
    
    Code.new(colors)
    
  end
  
  def initialize(pegs)
    @pegs = pegs
  end
  
  def self.random
    code = []
    until code.length == 4
      code << PEGS.values.shuffle.first
    end
    Code.new(code)    
    
  end
  
  def[](idx)
    self.pegs[idx]
  end
  
  def exact_matches(code)
    count = 0
    idx = 0
    while idx < code.pegs.length
      count += 1 if self[idx] == code[idx]
      idx += 1
    end
    
    count
    
  end
  
  def near_matches(code)
    result = []
    idx = 0
    while idx < code.pegs.length
      if self[idx] != code[idx] && self.pegs.uniq.include?(code[idx])  
        result << code[idx]
      end
      idx += 1
    end
    
    result.uniq.length
  
  end
  
  def ==(code)
    self.pegs.each_with_index do | peg, idx |
      return false if peg != code[idx].upcase   
    end
    true
  end
  
end


class Game
  attr_reader :secret_code
  
  def initialize(code = Code.random)
    @secret_code = code
    @number_of_turns = 0
    
  end
  
  def get_guess
    puts "Please input a guess"
    begin
      Code.parse(gets.chomp)
    rescue
      retry
    end
  end
  
  def display_matches(code)
    exact_matches = code.exact_matches(secret_code)
    near_matches = code.near_matches(secret_code)
   
   puts "#{exact_matches} exact matches"
   puts "#{near_matches} near matches"
    
  end
  
  def win?(guess)
    return true if guess == @secret_code
  end
  
  def lose?
    return true if @number_of_turns == 12
  end
  
  def play
    
    loop do 
      guess = get_guess
      display_matches(guess)
      if win?(guess)
        puts "You win!"
        break
      elsif lose?
        puts "You lost!"
        break
      end
      
      @number_of_turns += 1
    end
    
  end
  
end