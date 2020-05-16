def splat(array)
  yield(array)
end

birds = %w(raven finch hawk eagle)
result = splat(birds) do |_, _, *raptors|
  raptors
end

p result