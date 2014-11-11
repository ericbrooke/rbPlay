# Push
# Append — Pushes the given object(s) on to the end of this array.
# << or .push

# Pop
# Removes the last element from self and returns it, or nil if the array is empty.
# .pop


def greet(name)
  puts 'hello, ' + name + '!'
  greet2(name)
  puts 'getting ready to say bye...'
  bye
end

def greet2(name)
  puts 'how are you, ' + name + '?'
end

def bye
  puts 'ok bye!'
end

def fact(x)
  if x == 1
    return 1
  else
    puts x
    return x * fact(x-1)
  end
end
