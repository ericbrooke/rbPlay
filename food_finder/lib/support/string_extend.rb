class String

  #capitalise the first letter on each word, on every word in a string
  def titleize
	self.split(' ').collect {|word| word.capitalize}.join(" ")
  end
end
