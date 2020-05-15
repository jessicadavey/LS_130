=begin

input: an array and a block
output: integer

rules:
- count how many elements the block evaluates to true for, and return that value

Algorithm
1. count = 0
2. iterate through array
  - pass element to block
  - if return value is truthy, increment count
3. return count
=end

def count(array)
  count = 0

  array.each do |item|
    count += 1 if yield(item)
  end

  count
end

def count(array)
  array.inject(0) do |acc, item|
    acc += 1 if yield(item)
    acc
  end
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2