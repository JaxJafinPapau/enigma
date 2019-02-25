require './lib/shift_generator'

class Enigma
  include ShiftGenerator

  attr_reader :message,
              :key,
              :date,
              :alphabet

  def initialize(message, key = generate_key, date = date_getter)
    @message = message
    @key = key
    @date = date
    @alphabet = [*("a".."z")].join + " "
  end

  def encrypt(message = @message, key = @key, date = @date)
    encrypted_message = letter_looper(message, "forward").join
    {encryption: encrypted_message, key: key, date: date}
  end

  def decrypt(message, key, date)
    decrypted_message = letter_looper(message, "backward").join
    {decryption: decrypted_message, key: key, date: date}
  end

  def letter_looper(message, direction)
    encrypted_letters = []
    message_letters = message.chars
    symbols = message_letters.map.with_index do |character, index|
      if @alphabet.include?(character) == false
        [character, index]
      end
    end.compact
    ((message.length / 4) + 1).times do
      message_letters.shift(4).map.with_index do |character, index|
      next if @alphabet.include?(character) == false
      encrypted_letters << @alphabet[(rotated_index(character, index, direction))]
      end
    end
    symbols.each do |sym_ind|
      encrypted_letters.insert(sym_ind[1], sym_ind[0])
    end
    encrypted_letters.compact
  end

  def rotated_index(character, index, direction)
    direction == "forward" ? x = 1 : x = -1
    shifts = [a_shift * x, b_shift * x, c_shift * x, d_shift * x]
    (@alphabet.index(character) + shifts[index]) % 27
  end

  def date_getter
    @date = DateTime.now.strftime("%d%m%y")
  end
end
