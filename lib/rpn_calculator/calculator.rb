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
        @stack << input
      else
        raise InputError, "Input must either be a valid number or operator."
      end
    end

    # Evaluate the stack and return the result
    def output
      @stack.pop
    end

    private

  end

  class InputError < StandardError; end
end