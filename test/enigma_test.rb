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
    x = Date.today
    binding.pry
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
              }
    assert_equal expected, @enigma.encrypt(@enigma.message, @enigma.key, @enigma.date)
  end

  def test_enigma_can_get_current_date
    expected = DateTime.now.day.to_s.rjust(2, "0") + DateTime.now.month.to_s.rjust(2, "0") + DateTime.now.year.to_s
    assert_equal expected, @enigma.date_getter
  end
end
