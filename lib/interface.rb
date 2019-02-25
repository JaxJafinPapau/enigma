class Interface
  def welcome
    p "Welcome to Enigma. Please type 'exit' at any time to quit.\n" +
      "Please ensure you press 'return' after any input.\n" +
      "Enter (e) to encrypt or (d) to decrypt."
  end

  def encryption_menu
    p "Encryption Menu:\n" +
      "Enter a message to encrypt\n" +
      "Enter 'D' to add a custom date\n" +
      "Enter 'K' to add a custom key."
  end
end
