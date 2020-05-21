class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    word_array = split_into_words(@phrase)
    word_array.uniq.inject({}) do |count, word|
      count[word] = word_array.count(word)
      count
    end
  end

  def split_into_words(string)
    array = string.downcase.split(/[,\s]+/).map do |word|
      word.gsub(/([\W]+\z|\A[\W]+)/, "")
    end
    array.reject(&:empty?)
  end
end

=begin

rules (from tests):
1. words are case insensitive and hash keys should be downcase
2. hash keys are strings
3. words can be separated by commas or whitespace
4. numbers count as words
5. keep apostrophes in words but not other punctuation or symbols

Algorithm:
1. set count = {}
2. divide phrase string into an array of downcase words
  - use string.split on whitespace
  - remove non-word characters from beginning and end of each string
3. iterate through a uniqued version of array
  count[word] = original array.count(word)
4. return count
  


=end