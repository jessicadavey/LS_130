# class Anagram
#   def initialize(word)
#     @word = word
#   end

#   def match(potential_anagrams)
#     potential_anagrams.select { |word_to_check| anagram?(word_to_check) }
#   end

#   def anagram?(word_to_check)
#     @word.downcase.chars.sort == word_to_check.downcase.chars.sort &&
#       @word.downcase != word_to_check.downcase
#   end
# end

=begin

Anagram rules:
1. contains all letters of given word
2. identical word is not an anagram
3. anagrams are case insensitive

input: array of words
output: array of anagrams (subset of original array)
=end

# Alternate Solution (not using .sort):

=begin

Algorithm

1. split both words into arrays of lowercase characters
2. iterate through word1
   - if second array has the character, delete it
   - return false if it doesn't
3. at the end, return true if the second word array is empty
  and the words weren't the same word

=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(words)
    words.select { |word| anagram?(word, @word) }
  end

  private

  def anagram?(word1, word2)
    chars1 = word1.downcase.chars
    chars2 = word2.downcase.chars

    chars1.each do |char|
      return false unless chars2.include?(char)
      chars2.delete_at(chars2.index(char))
    end

    chars2.empty? && word1.downcase != word2.downcase
  end
end
