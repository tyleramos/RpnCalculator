module RpnCalculator

  class Calculator

    def initialize
      start_prompt
    end

    private

    def start_prompt
      $stdout.write <<-PROMPT
\nReverse Polish Notation Calculator\n
You can start by typing numbers (including negative and decimals) and operators.
Quit at any time with the `q` command.
Happy Calculating!\n\n
      PROMPT
      process_inputs
      $stdout.write "\nGoodbye!\n"
    end

    def process_inputs
      loop do
        $stdout.write '> '
        input = STDIN.gets.chomp
        return if input.to_s == 'q'

        $stdout.write "#{input}\n"
      end
    end

  end

end