
def test(&block)
  puts "1"
  block.call
  puts "2"
end

test { puts "xyz" }