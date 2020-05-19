class Octal
  def initialize(octal)
    @octal = octal
    @base = 8
  end

  def to_decimal
    return 0 unless valid_input?
    multiplier = 1
    @octal.chars.reverse.inject(0) do |result, num|
      result += (num.to_i * multiplier)
      multiplier *= @base
      result
    end
  end

  private

  def valid_input?
    @octal.match?(/\A[0-7]+\z/)
  end
end
