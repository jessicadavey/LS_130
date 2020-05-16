require 'pry'
=begin

input: array, object, block
output: final value of object

rules:
1. iterate over array
2. yield each element and object to the block
3. object may be updated by block
4. return object
5. if array is empty, return original object

Algorithm
1. iterate over the array 
2. yield each element and object to the block
3. 

=end

def each_with_object(array, obj)
  array.each do |item|
    yield(item, obj)
  end
  obj
end

def each_with_object(array, obj)
  array.inject(obj) do |obj, item|
    yield(item, obj)
    obj
  end
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}