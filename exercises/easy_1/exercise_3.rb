=begin

input - array of one or more integers, sorted
output - array of all missing numbers between first and last element

rules:
- return an array of all the missing integers in the sequence
- return an empty array if a one-element array is given

Algorithm:

1. make an array of all the integers between the first and last elements of the array
  arr.first..arr.last 
  convert this range to an array
2. compare the new array to the given array and return an array of the difference
  - result - given_array
=end

def missing(array)
  complete_range = array.first..array.last
  complete_range.to_a - array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []