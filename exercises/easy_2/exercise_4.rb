=begin
input: any number of arguments (can be 0) and a block
output: integer

rules:
1. yield each argument to the block
2. return number of times the block returns a truthy value
3. if given no arguments, return 0

Algorithm:
1. collect arguments into an array using *
2. set count = 0
3. iterate through array
  - yield each element to the block
  - each time the block returns a truthy value, increment count
4. return count

=end

def count(*args)
  count = 0
  args.each do |arg|
    count += 1 if yield(arg)
  end
  count
end

def count(*args)
  args.inject(0) do |acc, item|
    acc += 1 if yield(item)
    acc
  end
end


p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3