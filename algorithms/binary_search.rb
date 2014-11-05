  def binary(list, item)
    # keep track of what part of the list we are searching
    low = 0
    high = list.length.to_i - 1

    while low <= high
    # while we have not found the element

      mid = (low + high)/2
      # check the middle element
      guess = list[mid]

      if guess == item
        # found it!
        puts "found it #{item}"
        return mid
      elsif guess >= item
        # our guess was too high
        high = mid -1
      else
        # our guess was too low
        low = mid +1
      end
    end
    # item does not exist
    puts "no item #{item}"
    return false
  end

my_list = [1,3,5,7,9]

binary(my_list, 3)
# found

binary(my_list, -1)
# nil
