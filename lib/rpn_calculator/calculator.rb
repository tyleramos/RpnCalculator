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
        perform_operation(input)
      else
        input
      end
    end

    def perform_operation(operator)
      operands = stack.last(2)
      if valid_operation?(operator, operands)
        operands = stack.pop(2).map(&:to_f)
        new_value = operands[0].send(operator, operands[1]).to_s

        Input.new(new_value)
      end
    end

    def valid_operation?(operator, operands)
      unless operands.size == 2 && operands.all?(&:numeric?)
        raise InputError, "Must have at least two numeric values in the stack to perform an operation."
      end
      if operator.division? && operands.last.to_f.zero?
        raise InputError, "Cannot divide by zero."
      end

      true
    end

  end

  class InputError < StandardError; end
end