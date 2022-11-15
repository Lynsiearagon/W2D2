class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |c, i| indices << i if c == char }
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    end

    if !self.already_attempted?(char)
      indices = self.get_matching_indices(char)
      self.fill_indices(char, indices)
      @attempted_chars << char
      return true
    else
      self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    end
  end

  def ask_user_for_guess
    p 'Enter a char: '
    char = gets.chomp
    self.try_guess(char)
  end

  def win? 
    if @guess_word.join == @secret_word
      p 'WIN'
      return true
    else 
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else 
      return false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end
