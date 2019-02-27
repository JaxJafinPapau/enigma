require './test/test_helper'

class KeyAndDateGeneratorTest < Minitest::Test
  def setup
    @enigma = Enigma.new("hello world.", "02715", "040895")
  end

end
