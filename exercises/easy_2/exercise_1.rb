=begin
input: 3 arguments (start, stop, step) and a block
output: output of block for each step

rules:
- yield to block
- start with start value
- increment by step value
- stop at stop value (if over stop value?)
- choose a return value (range start..stop)

Algorithm
1. yield start value to block
2. increment by step value
3. if result is over stop, return range start..stop
4. otherwise yield that to the block

=end

def step(start, stop, step)
  current = start
  loop do
    yield(current)
    current += step
    break if current > stop
  end
  start..stop
end

step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10