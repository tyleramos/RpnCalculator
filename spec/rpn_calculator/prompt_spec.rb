require 'spec_helper'

describe RpnCalculator::Prompt do

  describe '#initialize' do
    it 'has a calculator and starts a prompt' do
      allow(STDIN).to receive(:gets).and_return("q")
      expect_any_instance_of(described_class).to receive(:start)
      expect(subject.calculator).not_to be_nil
    end
  end

end
