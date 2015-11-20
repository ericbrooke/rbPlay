from_file, to_file = ARGV

puts "Copying from #{from_file} to #{to_file}"

in_file = open(from_file)
indata = in_file.read

puts "The input file is #{indata.length} bytes long"

puts "Does the output file exist? #{File.exist(to_file)}"
puts "Ready, hit RETURN to continue, CTRL-C to abort"
$sdin.gets

out_file = open(to_file, 'w')
out_file.write(indata)

puts "All Done"

out_file.close
in_file.close
