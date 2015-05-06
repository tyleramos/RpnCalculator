module RpnCalculator

  class Input < String

    def initialize(input)
      super
    end

    def valid?
      numeric? || operator?
    end

    # Returns true if input is considered numeric
    def numeric?
      true if Float(self) rescue false
    end

    # Returns true if input is considered an operator
    def operator?
      valid_operators.include?(self)
    end

    def division?
      self == "/"
    end

    private

    # Returns an array of strings for each valid operator
    def valid_operators
      %w(+ - * / % **)
    end

  end

end