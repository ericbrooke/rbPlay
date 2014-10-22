def my_method
  temp @x +1
  my_other_method(temp)
  #both @x and my_other_method belong to the receiver
end
