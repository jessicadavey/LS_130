class Anagram
  def initialize(word)
    @word = word
  end

  def match(potential_anagrams)
    potential_anagrams.select { |word_to_check| anagram?(word_to_check) }
  end

  def anagram?(word_to_check)
    @word.downcase.chars.sort == word_to_check.downcase.chars.sort &&
      @word.downcase != word_to_check.downcase
  end
end

=begin

Anagram rules:
1. contains all letters of given word
2. identical word is not an anagram
3. anagrams are case insensitive


input: array of words
output: array of anagrams (subset of original array)
=end
