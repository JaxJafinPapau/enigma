class Enigma
  attr_reader :message,
              :key,
              :date
  def initialize
    @message = "hello world"
    @key = "02715"
    @date = "040895"
  end
end
