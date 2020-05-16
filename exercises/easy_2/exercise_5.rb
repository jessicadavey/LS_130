=begin

input: array, block
output: (new) array

rules:
1. iterate through the elements and yield them to the block
2. as soon as the block returns false/nil, return current element, plus all remaining elements in a new array
3. return an empty array if all values are truthy or given array is empty

Algorithm
1. iterate through array with index
2. yield each element to the block
3. if block returns false
  - return array.slice(current_index..-1)

=end

def drop_while(array)
  array.each_with_index do |item, index|
    return array.slice(index..-1) unless yield(item)
  end
  []
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []