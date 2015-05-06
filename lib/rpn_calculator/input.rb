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

    private

    # Returns an array of strings for each instance method that a Float responds to
    def valid_operators
      Float.instance_methods(false).map(&:to_s)
    end

  end

end