=begin

input: array, block
output: single item

rules:
1. pass each item to the block
2. return the item for which the block returns the largest value
3. return nil if array is empty

Algorithm
0. return nil if array.empty?
1. set max = array.first
2. iterate through array, yielding each item to the block
3. compare return value to max
4. if return value > max, max = item
5. return max

=end

def max_by(array)
  return nil if array.empty?

  max = array.first
  array.each do |item|
    max = item if yield(item) > yield(max)
  end
  max
end

p max_by([1, 5, 3]) { |value| value + 2 }  == 5
p max_by([1, 5, 3]) { |value| 9 - value }  == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil