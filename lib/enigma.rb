class Enigma
  attr_reader :message,
              :key,
              :date,
              :alphabet
  def initialize(message, key, date = DateTime.new)
    @message = message
    @key = key
    @date = date
    @alphabet = [*("a".."z")].join + " "
  end

  def encrypt(message, key, date)
    message.chars.each do ||
      next if character.nil?
      character
    end
    #get encrypt working no matter how long, then refactor
  end

  def date_getter
    @date.strftime("%d%m%y")
  end
end
