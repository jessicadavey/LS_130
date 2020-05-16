class TextAnalyzer
  def process
    file = File.open('text2.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs"}
analyzer.process { |text| puts "#{text.split("\n").count} lines"}
analyzer.process { |text| puts "#{text.split(" ").count} words"}

# 3 paragraphs
# 15 lines
# 126 words
