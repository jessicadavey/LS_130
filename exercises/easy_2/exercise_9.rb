=begin

input: array and a block
output: nil

rules:
1. take array elements 2 at a time and yield them to the block
2. return nil

Algorithm
1. set index = 0
2. loop
  1. yield array(index), array(index + 1) to block
  2. increment index by 1
  3. break if index > array.size - 2
3. return nil

[0, 1, 2, 3, 4, 5]

=end

def each_cons(array)
  index = 0
  loop do
    break if index > array.size - 2
    yield(array[index], array[index + 1])
    index += 1
  end
  nil
end

def each_cons(array)
  array[0..-2].each_with_index do |item, index|
    yield(item, array[index + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash  == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil