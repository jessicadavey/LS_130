class Luhn
  attr_accessor :num_array
  def initialize(number)
    @num_array = number.to_s.chars.map(&:to_i)
  end

  def addends
    addends = num_array.reverse.map.with_index do |num, index|
      index.odd? ? num * 2 : num
    end
    addends.reverse.map do |num|
      num >= 10 ? num - 9 : num
    end
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    luhn = new(number)
    luhn.num_array << 0
    digit_to_add = (10 - (luhn.addends.sum % 10)) % 10
    luhn.num_array.pop
    (luhn.num_array << digit_to_add).map(&:to_s).join.to_i
  end
end

=begin

Addends:
1. turn integer into string, into an array of characters
2. turn this back into integers
3. iterate through the array in reverse
4. transform every second digit
  - turn it into an integer and double it
  - if result >= 10, subtract 9
5. return result

Checksum:
1. sum the addends

Valid?
1. checksum % 10 == 0

Create:
1. get an invalid number
2. figure out what the addends would be if another number were placed on the end
3. figure out what to add to that sum to make it a multiple of 10
4. append that digit to the string version of invalid number
5. turn it into an integer and return it

=end
