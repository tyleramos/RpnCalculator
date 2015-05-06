require 'spec_helper'

describe RpnCalculator::Calculator do

  describe '#initialize' do
    it 'has an empty stack' do
      expect(subject.stack).to be_empty
    end
  end

  describe '#enter' do
    context 'for valid input' do
      it 'adds a value to the stack for valid input' do
        expect{ subject.enter("3") }.to change{ subject.stack.size }.by(1)
      end
    end
    context 'for invalid input' do
      it 'raises an error' do
        expect{ subject.enter("foo") }.to raise_error(RpnCalculator::InputError,
          'Input must either be a valid number or operator.')
      end
    end
  end

  describe '#output' do
    context 'for valid input' do
      it 'evaluates items in stack, returns result' do
        expect(subject).to receive(:evaluate)
        expect(subject.stack).to receive(:<<)
        expect(subject.output).to eql(subject.stack.last)
      end
      it 'given a stack of [3,2,+], returns 5.0' do
        valid_stack = [
          RpnCalculator::Input.new("3"),
          RpnCalculator::Input.new("2"),
          RpnCalculator::Input.new("+")
        ]
        allow(subject).to receive(:stack).and_return(valid_stack)
        expect(subject.output).to eql(RpnCalculator::Input.new("5.0"))
      end
    end
    context 'for invalid input' do
      it 'given a stack of [3,+], raises an error' do
        invalid_stack = [
          RpnCalculator::Input.new("3"),
          RpnCalculator::Input.new("+")
        ]
        allow(subject).to receive(:stack).and_return(invalid_stack)
        expect{ subject.output }.to raise_error(RpnCalculator::InputError,
          'Must have at least two numeric values in the stack to perform an operation.')
      end
      it 'given a stack of [3,0,/], raises an error' do
        invalid_stack = [
          RpnCalculator::Input.new("3"),
          RpnCalculator::Input.new("0"),
          RpnCalculator::Input.new("/")
        ]
        allow(subject).to receive(:stack).and_return(invalid_stack)
        expect{ subject.output }.to raise_error(RpnCalculator::InputError,
          'Cannot divide by zero.')
      end
    end
  end
end
