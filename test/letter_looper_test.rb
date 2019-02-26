require './test/test_helper'

class LetterLooperTest < Minitest::Test
  def setup
    @enigma = Enigma.new("hello world.", "02715", "040895")
  end
end
