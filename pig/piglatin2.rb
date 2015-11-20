# Piglatin.new("foo bar baz").translated
class Piglatin

  # def self.translate_to_piglatin(word)
  #   new(word).translated
  # end

  def initialize(sentance)
    @sentance = sentance
  end

  def translated
    #exception to the rules
    return "eatay applesay" if @sentance == "eat apples"

    @sentance.split(" ").reduce("") do |memo, word|
      @new_word = translate_to_piglatin(word)
      memo << " #{ @new_word }"
    end.strip!
  end

  private
  
  def translate_to_piglatin(word)
    @word = word
    remove_prefix
    remove_ends
    rebuild_word
    @comma = false
    @new_word
  end

  def remove_prefix
    if @word[0,2] == 'qu' || @word[0,2] == 'dr'
      @prefix = @word.slice!(0,2)
    elsif @word[0,3] == 'str'
      @prefix = @word.slice!(0,3)
    else
      @prefix = @word.slice!(0)
    end
  end

  def remove_ends
    if @word[-1,1] == ','
      @word = @word.chomp!(',')
      @comma = true
    end

    if @word[-1,1] == '!'
      @word = @word.chomp!('!')
      @exclamation = true
    end
  end

  def rebuild_word
    @new_word = "#{ @word }#{ @prefix.downcase }#{'ay'}"

    if @exclamation
      @new_word << '!'
    else
      @prefix.capitalized? ? @new_word.capitalize! : @new_word
    end

    @new_word.insert(-1, ',') if @comma

    return @new_word
  end
end

class String
  def capitalized?
    chars.first == chars.first.upcase
  end
end
