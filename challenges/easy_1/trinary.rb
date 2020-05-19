class Trinary
  def initialize(trinary)
    @trinary = trinary
    @base = 3
  end

  def to_decimal
    return 0 unless valid_input?
    multiplier = 1
    @trinary.chars.reverse.inject(0) do |result, num|
      result += (num.to_i * multiplier)
      multiplier *= @base
      result
    end
  end

  private

  def valid_input?
    @trinary.match?(/\A[0-2]+\z/)
  end
end
