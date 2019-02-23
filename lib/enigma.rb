class Enigma
  attr_reader :message,
              :key,
              :date,
              :alphabet
  def initialize(message, key = generate_key, date = DateTime.new)
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
