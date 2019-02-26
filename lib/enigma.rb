require './lib/shift_generator'
require './lib/message_manipulator'

class Enigma
  include ShiftGenerator
  include MessageManipulator

  attr_reader :message,
              :key,
              :date,
              :alphabet,
              :message_letters,
              :symbols

  def initialize(message, key = generate_key, date = date_getter)
    @message = message
    @key = key
    @date = date
    @alphabet = [*("a".."z")].join + " "
    @symbols = []
  end

  def encrypt(message = @message, key = @key, date = @date)
    naked_message = symbol_stripper(message.chars)
    encrypted_message = letter_looper(naked_message, "forward")
    output = symbol_adder(encrypted_message).join
    {encryption: output, key: key, date: date}
  end

  def decrypt(message, key, date)
    naked_message = symbol_stripper(message.chars)
    decrypted_message = letter_looper(naked_message, "backward")
    output = symbol_adder(decrypted_message).join
    {decryption: output, key: key, date: date}
  end

  def date_getter
    @date = DateTime.now.strftime("%d%m%y")
  end
end
