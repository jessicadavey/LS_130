require 'pry'

=begin

  input: integer, n
  output: array of prime numbers 2 to integer

  rules:
    - find all primes from 2 up to given integer
    - return them in an Array
    - use the sieve algorithm

  Algorithm:
  1. make a hash
    {2 => true, 3 => true, 4 => true... up to n => true}
  2. loop through the hash keys
    1. counter = 2
    2. if hash[counter] == true
      1. counter_value = counter
      2. counter += countervalue
      3. break if hash[counter] is greater than n
      4. set hash[counter] = false
    3. counter += 1
  3. return an array of keys for which the value is true

=end



class Sieve
  def initialize(limit)
    @limit = limit
    @range = {}
    (2..limit).each do |num|
      @range[num] = true
    end
  end

  def primes
    number_to_test = 1
      loop do
        number_to_test += 1
        break if number_to_test > Math.sqrt(@limit)
        next unless @range[number_to_test] == true
        current_value = step = number_to_test
        loop do
          current_value += step
          break if current_value > @limit
          @range[current_value] = false
        end
      end
    @range.select { |_, unmarked| unmarked }.keys
  end
end

sieve = Sieve.new(10)
p sieve.primes
