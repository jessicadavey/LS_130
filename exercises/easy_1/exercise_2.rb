def compute
  block_given? ? yield : "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def new_compute(arg)
  return "Does not compute." unless block_given?
  yield(arg)
end

p new_compute(7) == "Does not compute."
p new_compute(1) {|num| num + 1} == 2
p new_compute("hello") { |str| str + " world" } == "hello world"