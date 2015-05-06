module RpnCalculator

  class Prompt

    attr_accessor :calculator

    def initialize
      @calculator = Calculator.new
      start
    end

    private

    def start
      $stdout.write <<-PROMPT
\nReverse Polish Notation Calculator\n
You can start by typing numbers (including negative and decimals) and operators.
Print the state of the current stack with the `stack` command.
Quit at any time with the `q` command.
Happy Calculating!\n\n
      PROMPT
      listen_for_input
      $stdout.write "\nGoodbye!\n"
    end

    def listen_for_input
      loop do
        begin
          $stdout.write '> '
          input = $stdin.gets.chomp
          return if input.to_s == 'q'
          if input.to_s == 'stack'
            $stdout.write "#{calculator.stack}\n"
            next
          end

          calculator.enter(input)
          $stdout.write "#{calculator.output}\n"
        rescue InputError => e
          $stdout.write "#{e.message}\n"
        end
      end
    end

  end

end