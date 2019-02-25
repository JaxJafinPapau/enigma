require './lib/shift_generator'
require './lib/letter_looper'

class Enigma
  include ShiftGenerator
  include LetterLooper

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
    @message_letters = message.chars
    @symbols = []
  end

  def encrypt(message = @message, key = @key, date = @date)
    encrypted_message = letter_looper(message, "forward").join
    {encryption: encrypted_message, key: key, date: date}
  end

  def decrypt(message, key, date)
    decrypted_message = letter_looper(message, "backward").join
    {decryption: decrypted_message, key: key, date: date}
  end

  def date_getter
    @date = DateTime.now.strftime("%d%m%y")
  end
end
