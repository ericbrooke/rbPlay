def find_smallest(arr)
  smallest = arr[0]
  smallest_index = 0
  for i in 1..arr.length
    if arr[i] < smallest
      smallest = arr[i]
      smallest_index = i
    end
    smallest_index
  end
end

def selection_sort(arr)
  newArr = []
  for i in arr.length
    smallest = find_smallest(a)
    newArr.append(a.pop(smallest))
  end
  newArr
end

puts selection_sort([5, 3, 6, 2, 10])
