module MessageManipulator
  def letter_looper(message, direction)
    encrypted_letters = []
    ((message.count / 4) + 1).times do
      message.shift(4).map.with_index do |character, index|
      encrypted_letters << @alphabet[(rotated_index(character, index, direction))]
      end
    end
    encrypted_letters.compact
  end

  def rotated_index(character, index, direction)
    direction == "forward" ? x = 1 : x = -1
    shifts = [a_shift * x, b_shift * x, c_shift * x, d_shift * x]
    (@alphabet.index(character) + shifts[index]) % 27
  end

  def symbol_stripper(message)
    message.delete_if.with_index do |character, index|
      @symbols << [character, index] if @alphabet.include?(character) == false
    end.compact
  end

  def symbol_adder(message)
    @symbols.each do |symbol_index|
      message.insert(symbol_index[1], symbol_index[0])
    end
    message
  end
end
