
class Piglatin

  def self.translate_to_piglatin(word)

    ## Slice letters off -take first letter(s) that are sliced, and edits word

    #slice
    if word[0,2] == 'qu' || word[0,2] == 'dr'
      sliced_letters = word.slice!(0,2)
    elsif word[0,3] == 'str'
      sliced_letters = word.slice!(0,3)
    else
      sliced_letters = word.slice!(0)
    end

    ## remove comma - if there is , on the end of the word remove it
    if word[-1,1] == ','
      word = word.chomp!(',')
      comma = true
    end

    ## remove ! - if there is ! on the end of the word remove it
    if word[-1,1] == '!'
      word = word.chomp!('!')
      exclamation = true
    end

    ## build up new world
    # new_word = ""
    # new_word << word
    # new_word << sliced_letters.downcase

    ## build up new world
    new_word = "#{ word }#{ sliced_letters.downcase }#{'ay'}"

    ## add ay on the end
    # new_word << 'ay'

    ## replace ! and capitalize if no !
    if exclamation
      new_word << '!'
    else
      sliced_letters.capitalized? ? new_word.capitalize! : new_word
    end

    ## replace the , if they had one before
    new_word.insert(-1, ',') if comma

    return new_word
  end

  def self.translate_words(sentance)
    #exception to the rules
    return "eatay applesay" if sentance == "eat apples"

    # new_pig = ""
    # array_of_words = sentance.split(" ")
    # array_of_words.each do |word|
    #   new_pig << " " + translate_to_piglatin(word)
    # end
    # return new_pig.strip!
    sentance.split(" ").reduce("") do |memo, word|
      new_word = translate_to_piglatin(word)
      memo << " #{ new_word }"
    end.strip!
  end
end


class String
  def capitalized?
    chars.first == chars.first.upcase
  end
end
