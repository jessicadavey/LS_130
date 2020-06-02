class PigLatin
  SUFFIX = "ay"
  VOWELS = %w(a e i o u)

  def self.translate(phrase)
    phrase.split.map { |word| pig_latin(word) }.join(" ")
  end

  def self.pig_latin(word)
    if vowel_sound_start?(word)
      word + SUFFIX
    elsif three_letter_start?(word)
      word[3..-1] + word[0..2] + SUFFIX
    elsif two_letter_start?(word)
      word[2..-1] + word[0..1] + SUFFIX
    else
      word[1..-1] + word[0] + SUFFIX
    end
  end

  def self.vowel_sound_start?(word)
    VOWELS.include?(word[0]) || word[0..1] == 'yt' || word[0..1] == 'xr'
  end

  def self.three_letter_start?(word)
    (word[1..2] == 'qu' && !VOWELS.include?(word[0])) ||
      word[0..2] == 'thr' || word[0..2] == 'sch'
  end

  def self.two_letter_start?(word)
    word[0..1] == 'ch' || word[0..1] == 'qu' || word[0..1] == 'th'
  end
end
