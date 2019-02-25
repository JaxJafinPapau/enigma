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
    ((message.length / 4) + 1).times do
      message_letters.shift(4).map.with_index {|character, index| encrypted_letters << @alphabet[(rotated_index(character, index, direction))]}
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

  def generate_key
    possible_keys = [*(0..99999)]
    possible_keys.sample.to_s.rjust(5, '0')
  end

  def a_shift
    @key[0..1].to_i + offset[0].to_i
  end

  def b_shift
    @key[1..2].to_i + offset[1].to_i
  end

  def c_shift
    @key[2..3].to_i + offset[2].to_i
  end

  def d_shift
    @key[3..4].to_i + offset[3].to_i
  end

  def offset
    full_num = @date.to_i ** 2
    full_num.to_s[-4..-1]
  end
end
