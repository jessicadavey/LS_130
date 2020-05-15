=begin

input: array
output: boolean

rules:
- return false if given an empty array
- return true if the block evaluates to true for any element of the array
- stop processing immediately once an element evaluates to true
- can't use similar standard Ruby methods

Algorithm
0. return false if array is empty
1. iterate over the given array, passing each element to the block
2. each iteration:
  - if the block returns a truthy value, return true and stop
  - if at the end no truthy values are returned, return false

=end

def any?(array)
  array.each do |element|
    return true if yield(element)
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false