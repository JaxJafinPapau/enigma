require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_has_attributes
    assert_equal "hello world", @enigma.message
    assert_equal "02715", @enigma.key
    assert_equal "040895", @enigma.date
  end

  def test_enigma_can_encrypt_message
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    assert_equal expected, @enigma.encrypt()
  end
end
