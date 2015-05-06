module RpnCalculator

  class Calculator

    attr_accessor :stack

    def initialize
      @stack = []
    end

    def enter(input)
      @stack << input
    end

    def output
      @stack.pop
    end

    private

  end

end