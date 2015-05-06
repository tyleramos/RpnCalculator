require_relative 'rpn_calculator/version'
require_relative 'rpn_calculator/prompt'

module RpnCalculator

  def self.boot
    Prompt.new
  end

end
