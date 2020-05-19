class SumOfMultiples
  def initialize(*numbers)
    @divisors = valid_divisors?(numbers) ? numbers : [3, 5]
  end

  def to(limit)
    self.class.to(limit, @divisors)
  end

  def self.to(limit, divisors=[3, 5])
    raise TypeError, "Must enter a positive integer" unless positive_integer?(limit)
    range = (1...limit).to_a
    range.select { |num| multiple?(num, divisors) }
         .sum
  end

  def self.multiple?(num_to_check, divisors)
    divisors.each do |divisor|
      return true if num_to_check % divisor == 0
    end
    false
  end

  def self.positive_integer?(num)
    num.instance_of?(Integer) && num > 0
  end

  private

  def valid_divisors?(numbers)
    numbers.all? { |num|  self.class.positive_integer?(num)} &&
      !numbers.empty?
  end
end
