
class String
  def palindrome?
    self.downcase.scan(/\w/)
    self == self.reverse
  end
end

## ALT

def check_palandrome? word
 word == word.reverse ? true : false
end

## ALT if reverse does exist
def is_palindrome?(value)
 value.downcase!

 reversed = ""
 count = value.lentgth

while count > 0
 count -= 1
 reversed += value[count]
end

 if value == reversed
   return "#{value} is a palindrome"
 else
   return "#{value} is not a palindrome"
 end
end

puts "enter a word"
x = gets.chomp
p is_palindrome(a)
