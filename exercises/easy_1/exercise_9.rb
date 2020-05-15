=begin

input: array, block
output: boolean

rules:
 - return true if the block returns a truthy value for exactly one element, false otherwise
 - stop processing and return false as soon as a second truthy value is encountered
 - return false if array is empty


Algorithm
1. iterate through array
2. set a flag to false
3. if a truthy value is encountered
  - if flag is false, set to true
  - if flag is true, return false
4. return flag
=end

def one?(array)
  one_true = false
  array.each do |item|
    if yield(item)
      return false if one_true
      one_true = true
    end
  end
  one_true
end


p one?([1, 3, 5, 6]) { |value| value.even? } == true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false
p one?([2, 4, 6, 8]) { |value| value.even? } == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true } == false
p one?([1, 3, 5, 7]) { |value| false } == false
p one?([]) { |value| true } == false