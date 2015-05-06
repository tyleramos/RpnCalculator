module RpnCalculator

  class Prompt

    def initialize
      start
    end

    private

    def start
      $stdout.write <<-PROMPT
\nReverse Polish Notation Calculator\n
You can start by typing numbers (including negative and decimals) and operators.
Quit at any time with the `q` command.
Happy Calculating!\n\n
      PROMPT
      listen_for_input
      $stdout.write "\nGoodbye!\n"
    end

    def listen_for_input
      loop do
        $stdout.write '> '
        input = STDIN.gets.chomp
        return if input.to_s == 'q'

        $stdout.write "#{input}\n"
      end
    end

  end

end