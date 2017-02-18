require 'spec_helper'

describe Flickrgrid::KeywordsQueue do
  let(:keywords) { %w(a b c d e f g h j k l m) }
  let(:subject) { described_class.create(keywords: keywords) }

  describe '.create' do
    it 'read dictionary and initialize queue' do
      expect(File).to receive(:readlines).and_return(keywords)
      expect(subject).to be_a(described_class)
    end
  end

  describe '.new' do
    it 'initialize queue' do
      expect { described_class.new(keywords) }.to_not raise_error
    end

    context 'not enough keywords' do
      let(:keywords) { %w(just three words) }
      it 'should raise error' do
        expect { described_class.new(keywords) }.to raise_error(StandardError)
      end
    end
  end

  describe '#pop' do
    it 'return last keyword from queue' do
      expect(subject.pop).to eq keywords.first
    end

    context 'queue empty' do
      before(:each) do
        expect(File).to receive(:readlines).and_return([])
      end
      it 'should raise error' do
        keywords.count.times { subject.pop }
        expect { subject.pop }.to raise_error(StandardError)
      end
    end
  end
end
