require './test/test_helper'

class LetterLooperTest < Minitest::Test
  def setup
    @enigma = Enigma.new("hello world.", "02715", "040895")
  end

  def test_enigma_can_loop_through_letters
    message = "hello world"
    expected = "keder ohulw".split("")
    assert_equal expected, @enigma.letter_looper(message.chars, "forward")
  end

  def test_enigma_can_find_rotated_index
    assert_equal 10, @enigma.rotated_index("h", 0, "forward")
  end

  def test_enigma_can_strip_symbols_from_messages
    assert_equal "hello world", @enigma.symbol_stripper("hello, world.".chars).join
    assert_equal ",", @enigma.symbols[0][0]
  end

  def test_symbol_adder_can_add_symbols_to_messages
    @enigma.symbol_stripper("hello, world.".chars)
    assert_equal "hello, world.", @enigma.symbol_adder("hello world".chars).join
  end
end
