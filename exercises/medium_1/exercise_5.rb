items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


gather(items) do |*items, item4|
  puts items.join(", ")
  puts item4
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!


gather(items) do |item1, *items, item4|
  puts item1
  puts items.join(", ")
  puts item4
end
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!


gather(items) do |item, *items|
  puts item
  puts items.join(", ")
end
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do |*items, item4|
  puts "#{items.join(", ")} and #{item4}"
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!