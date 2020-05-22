class SecretHandshake
  REVERSE_COMMANDS = ['jump', 'close your eyes', 'double blink', 'wink']

  def initialize(input)
    @commands =
      if input.instance_of?(String) && input.match?(/[\A[01]+\z]/)
        input
      else
        input.to_i.to_s(2)
      end
  end

  def commands
    handshake = []
    -1.downto(-@commands.size) do |index|
      if index == -5
        handshake.reverse!
        break
      end
      handshake << REVERSE_COMMANDS[index] if @commands[index] == '1'
    end
    handshake
  end
end

=begin
handshake commands:
1 = wink
10 = double blink
100 = close your eyes
1000 = jump

10000 = Reverse the order of the operations in the secret handshake.

Original Algorithm (refactored later)
1. get a decimal number
2. convert it to a binary string
  if string.size >= 4
    set a flag reverse = true
    string.slice[1..-1]
3. loop through the string in reverse
  if character at current position == 1,
    add the corresponding command to a commands array
4. return the commands array

=end
