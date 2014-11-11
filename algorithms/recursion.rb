def look_for_key(main_box)
  pile =  main_box.make_a_pile_to_look_through()
  while pile !nil?
    box = pile.grab_a_box
    box.each do |item|
      if item.is_a_box
        pile.append(box)
      elsif item.is_a_key
        puts 'Found the box'
      end
    end
  end
end

def look_for_key(box)
  box.each do |item|
    if item.is_a_box
      look_for_key(box)
    elsif
      puts 'found the key'
    end
  end
end

# every recursive function has two parts: the base case and the
# the recursive case. The base is when the function does not call
# itself again

# this has only recursive case
def countdown(i)
  puts i
  countdown(i - 1)
end

# this has both the recursive and base case

def countdown(i)
  puts i
  # base case
  if 1 <= 0
    return
  elsif
    # recursive case
    countdown(i - 1)
  end
end
