require 'spec_helper'

describe Flickrgrid::Downloader do
  let(:queue) { double }
  let(:subject) { described_class.new(queue) }

  describe '.get_images' do
    it 'should call async download' do
      expect_any_instance_of(described_class).to receive(:async_download!)
      described_class.get_images(queue)
    end
  end

  describe '#async_download!' do
    it 'should return array of downloaded files' do
      file = Tempfile.new
      expect_any_instance_of(described_class).to receive(:download_image).exactly(Flickrgrid::IMG_COUNT).times
        .and_return(file)
      expect(subject.async_download!).to eq([file] * 10)
    end
  end
end
