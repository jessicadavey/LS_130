class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']

  def binary_string?(input)
    input.instance_of?(String) && input.match?(/[\A[01]+\z]/)
  end

  def initialize(number)
    @command_string = binary_string?(number) ? number : number.to_i.to_s(2)
  end

  def commands
    @command_string.reverse!

    handshake = []
    [@command_string.size, COMMANDS.size].min.times do |index|
      handshake << COMMANDS[index] if @command_string[index] == '1'
    end

    @command_string.size >= 5 ? handshake.reverse : handshake
  end
end

=begin
handshake commands:
1 = wink
10 = double blink
100 = close your eyes
1000 = jump

10000 = Reverse the order of the operations in the secret handshake.



Algorithm
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
