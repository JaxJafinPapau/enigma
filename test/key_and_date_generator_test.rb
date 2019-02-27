require './test/test_helper'

class KeyAndDateGeneratorTest < Minitest::Test
  def setup
    @enigma = Enigma.new("hello world.", "02715", "040895")
  end

  def test_enigma_can_get_current_date
      enigma = Enigma.new("hello world", "02715")
      assert_equal 6, enigma.date_getter.length
      assert_instance_of String, enigma.date_getter
      assert_instance_of Integer, enigma.date_getter.to_i
  end
end
