class DNA
  def initialize(strand)
    validate_input(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    validate_input(other_strand)

    count = 0
    short_strand, long_strand = [@strand, other_strand].sort_by(&:length)
    short_strand.each_char.with_index do |char, index|
      count += 1 unless char == long_strand[index]
    end

    count
  end

  def validate_input(string)
    raise ArgumentError, "Invalid DNA sequence" unless valid_sequence?(string)
  end

  def valid_sequence?(input)
    input.instance_of?(String) && input.match?(/\A[GACT]*\z/)
  end
end

=begin

input: DNA sequence (string)
output: Hamming distance (integer)

rules:
1. output the number of differences between 2 DNA strands
2. if one strand is longer, cut off the end so they're the same length
3. 2 empty strands have a distance of 0
4. don't mutate original strand
implicit:
1. test for valid input? (string of only GACT)
=end
