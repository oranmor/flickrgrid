require 'spec_helper'

describe Flickrgrid::App do
  let(:params) { { output: 'test.jpg', keywords: %w(test test2) } }

  describe '.start' do
    it 'should call cli and create instance' do
      expect(Flickrgrid::Cli).to receive(:parse!).and_return(params)
      expect(described_class).to receive(:new).with(params)
      described_class.start
    end
  end

  describe '.initialize' do
    let(:queue) { double }
    let(:images) { [double, double] }
    it 'should call Flickrgrid classes' do
      expect(Flickrgrid::KeywordsQueue).to receive(:create).and_return(queue)
      expect(Flickrgrid::Downloader).to receive(:get_images).with(queue).and_return(images)
      expect(Flickrgrid::CollageCreator).to receive(:new).with(params[:output], images)
      described_class.new(params)
    end
  end
end
