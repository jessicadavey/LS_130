=begin

input: 2 arrays of same length
output: 1 nested array

rules:
- 'zip' the two arrays together
- don't change the original array
- resulting array is same length as each initial array
  - each element is a 2-element array, one element from each original array
- don't use Array#zip

Algorithm

1. map with index
2. transform current element to [current, array2[index]]
=end

def zip(arr1, arr2)
  arr1.map.with_index do |num, index|
    [num, arr2[index]]
  end
end



p zip([1, 2, 3], [4, 5, 6])  == [[1, 4], [2, 5], [3, 6]]