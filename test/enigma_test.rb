require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new("hello world", "02715", "040895")
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_has_attributes
    enigma = Enigma.new("hello world")
    assert_equal "hello world", @enigma.message
    assert_equal "02715", @enigma.key
    assert_equal "040895", @enigma.date
    assert_equal "abcdefghijklmnopqrstuvwxyz ", @enigma.alphabet
    assert_equal 5, enigma.key.length
  end

  # def test_enigma_can_encrypt_message
  #   expected = {
  #               encryption: "keder ohulw",
  #               key: "02715",
  #               date: "040895"
  #             }
  #   assert_equal expected, @enigma.encrypt(@enigma.message, @enigma.key, @enigma.date)
  # end

  def test_enigma_can_get_current_date
    enigma = Enigma.new("hello world", "02715")
    assert_instance_of DateTime, enigma.date
    assert_equal 6, enigma.date_getter.length
  end

  def test_enigma_can_generate_keys
    assert_instance_of String, @enigma.generate_key
    assert_equal 5, @enigma.generate_key.length
  end

  def test_enigma_can_get_shifts

  end
end
