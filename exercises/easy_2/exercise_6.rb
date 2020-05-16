=begin

input: array, block
output: same array

rules:
1. yield each item of the array and its index to the block
2. return the original array

Algorithm:

1. set index = 0
2. loop
  1. yield array[index], index to block
  2. increment index
  3. break if index == array.size
3. return starting array

=end

def each_with_index(array)
  index = 0
  loop do
    break if index == array.size
    yield(array[index], index)
    index += 1
  end
  array
end



result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true