require './lib/enigma'

output = File.open(ARGV[1], 'w')
message = File.open(ARGV[0])
key = ARGV[2]
date = ARGV[3]
enigma = Enigma.new(message.read, key, date)
output.write(enigma.decrypt(enigma.message, key, date)[:decryption])
output.close
message.close
puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
