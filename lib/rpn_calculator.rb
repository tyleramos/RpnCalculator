require_relative 'rpn_calculator/version'
require_relative 'rpn_calculator/calculator'

module RpnCalculator

  def self.boot
    Calculator.new
  end

end
