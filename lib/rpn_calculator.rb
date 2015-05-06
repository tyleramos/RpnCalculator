require_relative 'rpn_calculator/version'
require_relative 'rpn_calculator/prompt'
require_relative 'rpn_calculator/calculator'

module RpnCalculator

  def self.boot
    Prompt.new
  end

end
