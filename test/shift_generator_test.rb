require './test/test_helper'

class ShiftGeneratorTest < Minitest::Test
  def setup
    @enigma = Enigma.new("hello world.", "02715", "040895")
  end

  def test_enigma_can_get_shifts
    assert_equal 03, @enigma.a_shift
    assert_equal 27, @enigma.b_shift
    assert_equal 73, @enigma.c_shift
    assert_equal 20, @enigma.d_shift
  end

  def test_enigma_can_generate_offset
    assert_equal "1025", @enigma.offset
  end
end
