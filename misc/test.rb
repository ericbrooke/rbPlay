
characters = []
loop do
  puts "character"
  name = gets.chomp
  if name.empty?
    break
  else
    characters << name
  end
end
