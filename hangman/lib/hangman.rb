

class ComputerPlayer
  
  attr_reader :dictionary, :secret_word, :candidate_words
  
  def initialize(dictionary = File.readlines('lib/dictionary.txt'))
    @dictionary = dictionary
    @secret_word = nil
  end
  
  def pick_secret_word
    @secret_word = dictionary.sample.strip
    secret_word.length
  end
  
  def check_guess(letter)
    result = []
    secret_word.each_char.with_index do | char,idx |
      result << idx if char == letter 
    end
    result
  end
  
  def guess(board)
    p board
    puts "Please guess a letter"
    letter_count = Hash.new(0)
    candidate_words.each do |word|
      word.each_char do |letter|
        letter_count[letter] += 1 unless board.include?(letter)
      end
    end
    letter,count = letter_count.max_by { |letter,count| count }
    letter
  end
  
  def handle_response(guess, spots)
    candidate_words.each do |word|
      spots.each do |spot|
        candidate_words.delete(word)  if guess != word[spot] 
      end
    end
    
    if spots.length == 1
      candidate_words.each do |word|
        count = 0
        word.each_char do |letter|
          count += 1 if letter == guess  
        end
        candidate_words.delete(word) if count > spots.length
      end
    end
    
    if spots.length == 0
      candidate_words.each do |word|
        candidate_words.delete(word) if word.include?(guess)
      end
    end 
    candidate_words
  end
  
  def register_secret_length(length)
    @candidate_words = []
    dictionary.each do |word|
      word = word.strip
      @candidate_words << word if word.length == length
    end
    candidate_words
  end
  
end

class HumanPlayer
  
  attr_reader :secret_word
  
  def initialize
    @secret_word = nil
  end
  
  def pick_secret_word
    puts "Please pick a word from the dictionary"
    @secret_word = gets.chomp
    secret_word.length
  end
  
  def guess(board)
    p board
    puts "Please guess a letter"
    letter = gets.chomp
  end  
  
  def register_secret_length(length)
    length
  end
  
  def handle_response(guess, spot)
    puts "Not a valid input. Try again."
  end
end

class Hangman
  
  attr_reader :guesser, :referee, :board
  
  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = ""
  end
  
  def setup
    puts "Referee, please pick the secret word."
    word = referee.pick_secret_word
    @board += "_" * word
    guesser.register_secret_length(word)
  end
  
  def update_board(letters_correct, guess)
    letters_correct.each do |idx|
      board[idx] = guess  
    end
    board
  end
  
  def take_turn
    puts "Guesser, please type in a guess"
    guess = guesser.guess(board)
    letters_correct = referee.check_guess(guess)
    update_board(letters_correct, guess)
    guesser.handle_response
  end
  
  def win?
    return true if board.each_char.all?{ |char| char != "_" }
  end
  
  def play
    setup
    loop do 
      p board
      take_turn
      break if win?
    end
  end
  
end



