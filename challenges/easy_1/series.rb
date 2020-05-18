class Series
  def initialize(string)
    @string = string
  end

  def slices(num)
    raise ArgumentError, "Slice length is longer than string length." if num > @string.size

    result = []
    @string.chars.map(&:to_i).each_cons(num) { |group| result << group }
    result
  end
end
