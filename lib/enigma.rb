require './lib/shift_generator'
require './lib/message_manipulator'
require './lib/key_and_date_generator'
require 'date'

class Enigma
  include ShiftGenerator
  include MessageManipulator
  include KeyAndDateGenerator
  attr_reader :message,
              :key,
              :date,
              :alphabet,
              :symbols

  def initialize(message, key = generate_key, date = date_getter)
    @message = message
    @key = key
    @date = date
    @alphabet = [*("a".."z")].join + " "
    @symbols = []
  end

  def encrypt(message = @message, key = @key, date = date_getter)
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
end
