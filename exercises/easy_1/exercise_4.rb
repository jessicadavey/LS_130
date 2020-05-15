=begin

input: positive integer
output: array

rules:
- return an array of all the numbers that divide evenly into the given integer
- can be in any order

Algorithm

1. loop through all the numbers between 1 and the given number
2. use % operator to divide current number into given number
3. if remainder == 0, add current number to results array

=end

def divisors(num)
  results = []
  divisor = 1

  loop do
    results << divisor if num % divisor == 0
    break if divisor == num
    divisor += 1
  end

  results
end

def divisors(num)
  (1..num).select { | divisor | num % divisor == 0}
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute