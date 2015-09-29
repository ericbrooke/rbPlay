# Version 2
(1..100).each do |n|
  z = ''
  z += 'Fizz' if n % 3 == 0
  z += 'Buzz' if n % 5 == 0
  puts(z.empty? ? n : z)
end

# Version 1
def fizzbuzz?(num)
  case
  when num % 15 == 0 then 'FizzBuzz'
  when num % 3 == 0 then 'Fizz'
  when num % 5 == 0 then 'Buzz'
  else num
  end
end

def fizz_buzz_to(limit)
  1.upto(limit).each do |num|
    puts fizzbuzz?(num)
  end
end

limit = 30
fizz_buzz_to(limit)
