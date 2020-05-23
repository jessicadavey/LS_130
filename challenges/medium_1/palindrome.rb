# Write a method that cn determine is a given string is a palindrome

# ignore non letters - no1, 3on is a palindrome
# case insensitive
# can't use 'reverse method
# can't use regex

def reverse(array)
  array.each_with_object([]) do |item, result|
    result.prepend(item)
  end
end

def palindrome?(string)
  raise ArgumentError, "must supply a string" unless string.is_a?(String)
  letters = string.downcase.chars.select do |char|
    (97..122).cover?(char.ord)
  end
  letters == reverse(letters)
end

p palindrome?('no1, 3on') == true
p palindrome?('hello') == false
p palindrome?('Rotor') == true
p palindrome?('Zaaz') == true
p palindrome?('')
p palindrome?('5oio(*')
