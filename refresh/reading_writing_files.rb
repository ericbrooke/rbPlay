filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL C (^C)"
puts "If you do want that, hit RETURN."

$stdin.gets

puts "Opening the File.."
target = open(filename, 'w')

puts "Trucating the file. Goodbye!"
target.truncate(0)

puts "Now I am going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

puts "And Finally, we close it."
target.close
