require 'spec_helper'

describe Flickrgrid::Layout do
  describe '.get_size' do
    it 'should return image size' do
      expect(described_class.get_size(0)).to eq '384x360'
    end
  end

  describe '.get_offset' do
    it 'should return image offset' do
      expect(described_class.get_offset(0)).to eq '+0+0'
    end
  end

  describe '.height' do
    it 'should return layout height' do
      expect(described_class.height).to eq described_class::HEIGHT
    end
  end

  describe '.width' do
    it 'should return layout width' do
      expect(described_class.width).to eq described_class::WIDTH
    end
  end
end
