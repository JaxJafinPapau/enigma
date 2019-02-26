require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new("hello world.", "02715", "040895")
  end

  def test_enigma_exists
    assert_instance_of Enigma, @enigma
  end

  def test_enigma_has_attributes
    enigma = Enigma.new("hello world")
    assert_equal "hello world.", @enigma.message
    assert_equal "02715", @enigma.key
    assert_equal "040895", @enigma.date
    assert_equal "abcdefghijklmnopqrstuvwxyz ", @enigma.alphabet
    assert_equal 5, enigma.key.length
  end

  def test_enigma_can_encrypt_message
    expected = {
                encryption: "keder ohulw.",
                 key: "02715",
                date: "040895"
              }
    assert_equal expected, @enigma.encrypt()
  end

  def test_enigma_can_get_current_date
    enigma = Enigma.new("hello world", "02715")
    assert_equal 6, enigma.date_getter.length
    assert_instance_of String, enigma.date_getter
    assert_instance_of Integer, enigma.date_getter.to_i
  end

  def test_enigma_can_decrypt
    message = "keder ohulw"
    key = "02715"
    date = "040895"
    expected = {
                decryption: "hello world",
                key: key,
                date: date
                }
    assert_equal expected, @enigma.decrypt(message, key, date)
  end

  def test_enigma_can_encrypt_with_random_date_and_key
    enigma = Enigma.new("hello world")
    encrypted_message = enigma.encrypt
    decrypted_message = enigma.decrypt(
      encrypted_message[:encryption],
      encrypted_message[:key],
      encrypted_message[:date]
      )[:decryption]
    assert_equal 11, encrypted_message[:encryption].length
    assert_equal "hello world", decrypted_message
  end
end
