class SumOfMultiples
  def initialize(*numbers)
    @divisors = valid_divisors?(numbers) ? numbers : [3, 5]
  end

  def to(limit)
    raise TypeError, "Must enter a positive integer" unless positive_integer?(limit)
    (1...limit).to_a.select { |num| multiple?(num) }
         .sum
  end

  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end

  private

  def multiple?(num_to_check)
    @divisors.any? { |divisor| num_to_check % divisor == 0 }
  end

  def positive_integer?(num)
    num.instance_of?(Integer) && num > 0
  end

  def valid_divisors?(numbers)
    numbers.all? { |num| positive_integer?(num) } &&
      !numbers.empty?
  end
end
