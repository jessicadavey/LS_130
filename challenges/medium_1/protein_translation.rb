class InvalidCodonError < RuntimeError
end

class Translation
  CODONS = { 'Phenylalanine' => ['UUU', 'UUC'],
             'Methionine' => ['AUG'],
             'Leucine' => ['UUA', 'UUG'],
             'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
             'Tyrosine' => ['UAU', 'UAC'],
             'Cysteine' => ['UGU', 'UGC'],
             'Tryptophan' => ['UGG'],
             'STOP' => ['UAA', 'UAG', 'UGA'] }

  def self.of_codon(codon)
    CODONS.each do |amino_acid, array|
      return amino_acid if array.include?(codon)
    end

    raise InvalidCodonError
  end

  def self.of_rna(rna)
    result = []

    rna.chars.each_slice(3) do |codon|
      result << of_codon(codon.join)
    end

    result.take_while do |amino_acid|
      amino_acid != 'STOP'
    end
  end
end

# Codon	Amino Acids
# AUG	Methionine
# UUU, UUC	Phenylalanine
# UUA, UUG	Leucine
# UCU, UCC, UCA, UCG	Serine
# UAU, UAC	Tyrosine
# UGU, UGC	Cysteine
# UGG	Tryptophan
# UAA, UAG, UGA	STOP
