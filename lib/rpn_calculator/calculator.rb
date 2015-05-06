module RpnCalculator

  class Calculator

    attr_accessor :stack

    def initialize
      @stack = []
    end

    # Adds input to the calculator stack in memory
    def enter(raw_input)
      input = Input.new(raw_input)
      if input.valid?
        stack << input
      else
        raise InputError, "Input must either be a valid number or operator."
      end
    end

    # Evaluate the stack and return the result
    def output
      stack << evaluate(stack.pop)

      stack.last
    end

    private

    # If input is an operator, perform operation on given arguments
    def evaluate(input)
      if input.operator?
        operands = stack.pop(2).map(&:to_f)
        operands.first.send(input, operands.last)
      else
        input
      end
    end

  end

  class InputError < StandardError; end
end