class Enigma
  attr_reader :message,
              :key,
              :date
  def initialize
    @message = "hello world"
    @key = "02715"
    @date = "040895"
  end

  def encrypt(message, key, date)
  end

  def date_getter
    DateTime.now.day.to_s.rjust(2, "0") +
    DateTime.now.month.to_s.rjust(2, "0") +
    DateTime.now.year.to_s
  end
end
