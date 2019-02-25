require './test/test_helper'

class InterfaceTest < Minitest::Test
  def setup
    @interface = Interface.new
  end

  def test_interface_exists
    assert_instance_of Interface, @interface
  end

  def test_interface_can_display_welcome
    expected = "Welcome to Enigma. Please type 'exit' at any time to quit.\n" +
               "Please ensure you press 'return' after any input.\n" +
               "Enter (e) to encrypt or (d) to decrypt."
    assert_equal expected, @interface.welcome
  end

  def test_interface_can_display_encryption_menu
    expected = "Encryption Menu:\n" +
               "Enter a message to encrypt\n" +
               "Enter 'D' to add a custom date\n" +
               "Enter 'K' to add a custom key."
    assert_equal expected, @interface.encryption_menu
  end

  def test_interface_can_display_decryption_menu
    expected = "Decryption Menu:\n" +
               "Enter a message to decrypt\n" +
               "Enter 'D' to add a custom date\n" +
               "Enter 'K' to add a custom key."
    assert_equal expected, @interface.decryption_menu
  end

  def test_interface_conducts_exit_interview
    expected = "Thank you for using Enigma for your encryption needs.\n" +
               "Would you like to contine (e) encrypting?\n" +
               "Would you like to continue (d) decrypting?\n" +
               "Would you like to (x) exit?"
    assert_equal expected, @interface.exit_interview
  end
end
