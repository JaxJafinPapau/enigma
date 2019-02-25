module LetterLooper
  def letter_looper(message, direction)
    encrypted_letters = []
    message_letters = message.chars
    symbols = message_letters.map.with_index do |character, index|
      if @alphabet.include?(character) == false
        [character, index]
      end
    end.compact
    ((message.length / 4) + 1).times do
      message_letters.shift(4).map.with_index do |character, index|
      next if @alphabet.include?(character) == false
      encrypted_letters << @alphabet[(rotated_index(character, index, direction))]
      end
    end
    symbols.each do |sym_ind|
      encrypted_letters.insert(sym_ind[1], sym_ind[0])
    end
    encrypted_letters.compact
  end

  def rotated_index(character, index, direction)
    direction == "forward" ? x = 1 : x = -1
    shifts = [a_shift * x, b_shift * x, c_shift * x, d_shift * x]
    (@alphabet.index(character) + shifts[index]) % 27
  end
end
