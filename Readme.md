Welcome to Enigma! An encryption/decryption program for Turing School of Software and Design, Mod 1 final project.

Directions:

1. In order to use this program please fork and clone to your local machine.
2. Ensure you have ruby 2.4.1 and the gem 'bundler' installed.
3. Run the command 'bundle' on the Enigma directory from the command line.
4. Pick your favorite text editor and open the file message.txt.
5. Edit the file contents within the "" to enter a message you would like to encrypt and save the file.
6. From the command line, run the command 'ruby lib/encrypt.rb message.txt encrypted.txt' to encrypt your message.
7. The command line will read back to you: 'Created 'encrypted.txt' with the key ##### and date ######' Make sure to take note of these numbers if you are not planning to decrypt right away.
8. Open the file encrypted.txt file to find your encrypted message should you wish to view it.
9. In order to decrypt, simply run the command 'ruby lib/decrypt.rb encrypted.txt <key number> <date number>' with the key and date numbers that correspond to your message.
10. You can change the <encrypted.txt> in #6 to change the file name output as desired, just remember to correspondingly change the 'encrypted.txt' in #9 to decrypt properly.

Self Assessment:

Functionality: 3 Enigma Class with encrypt and decrypt methods were successfully implemented. Encrypt/decrypt command line interfaces were successfully implemented.

OOP: 4 key_and_date_generator and message_manipulator could be used for another encryption program with only light edits. All methods are less than 8 LOC. All classes are less than 100 LOC.

TTD: 4- (Jeff gave Glynnis and I a 3-, so I figure that's ok) All test names clearly communicate purpose and test coverage is 100%. No use of mocks and stubs.

Version Control: 4 Final version control metrics: 76 commits, 15 PR's. All commit messages are unambiguous. No commits include multiple pieces of functionality.
