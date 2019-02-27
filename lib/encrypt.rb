require './lib/enigma'

output = File.open(ARGV[1], 'w')
message = File.open(ARGV[0])
enigma = Enigma.new(message.read.downcase)
key = enigma.key
date = enigma.date
output.write(enigma.encrypt[:encryption])
output.close
message.close
puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
