def factorial(num)
  result = 1
  num.times do |n|
    result *= n + 1
  end
  result
end

enum = Enumerator.new do |y|
  a = 0
  loop do
    y << factorial(a)
    a += 1
  end
end

7.times { puts enum.next }
enum.rewind

enum.each_with_index do | num, index |
  puts num
  break if index == 6
end