require 'spec_helper'

describe RpnCalculator::Input do

  describe '#valid?' do
    let(:subject) { described_class.new('') }
    context 'for valid input' do
      it 'returns true' do
        allow(subject).to receive(:numeric?).and_return(true)
        allow(subject).to receive(:operator?).and_return(false)
        expect(subject.valid?).to eql true
      end
    end
    context 'for invalid input' do
      it 'returns false' do
        allow(subject).to receive(:numeric?).and_return(false)
        allow(subject).to receive(:operator?).and_return(false)
        expect(subject.valid?).to eql false
      end
    end
  end

  describe '#numeric?' do
    context 'for valid input' do
      it 'returns true' do
        subject = described_class.new("3")
        expect(subject.numeric?).to eql true
      end
    end
    context 'for invalid input' do
      it 'returns false' do
        subject = described_class.new("foo")
        expect(subject.numeric?).to eql false
      end
    end
  end

  describe '#operator?' do
    context 'for valid input' do
      it 'returns true' do
        subject = described_class.new("+")
        expect(subject.operator?).to eql true
      end
    end
    context 'for invalid input' do
      it 'returns false' do
        subject = described_class.new("foo")
        expect(subject.operator?).to eql false
      end
    end
  end

  describe '#division?' do
    context 'if input is /' do
      it 'returns true' do
        subject = described_class.new("/")
        expect(subject.division?).to eql true
      end
    end
    context 'if input is *' do
      it 'returns false' do
        subject = described_class.new("*")
        expect(subject.division?).to eql false
      end
    end
  end

end
