=begin

input: array, block
output: transformed array of equal length

rules:
1. yield each element of given array to a block
2. return a new array with the block's return values
3. if given an empty array, return an empty array

Algorithm:

1. iterate through array
2. yield each element to the block
3. add each return value to a new array

=end

def map(array)
  result = []

  array.each do |element|
    result << yield(element)
  end

  result
end


p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]