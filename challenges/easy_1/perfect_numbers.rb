class PerfectNumber
  def self.classify(number)
    raise "must supply a positive integer" unless positive_integer?(number)
    sum = aliquot(number)
    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  def self.positive_integer?(number)
    number.is_a?(Integer) && number > 0
  end

  def self.aliquot(number)
    # find all divisors < number
    divisors = (1...number).select { |num| number % num == 0 }
    # add them together
    divisors.sum
  end
end
