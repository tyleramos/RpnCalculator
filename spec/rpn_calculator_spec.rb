require 'spec_helper'

describe RpnCalculator do
  it 'has a version number' do
    expect(RpnCalculator::VERSION).not_to be nil
  end

  it 'boots prompt and quits without error' do
    allow(STDIN).to receive(:gets).and_return("q")
    expect(RpnCalculator.boot).to be_truthy
  end
end
