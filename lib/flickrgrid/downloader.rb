require 'open-uri'

module Flickrgrid
  class Downloader
    REDO_COUNT = 10

    attr_reader :files

    class << self
      def get_images(keywords_queue)
        downloader = new(keywords_queue)
        downloader.async_download!
        downloader.files
      end
    end

    def initialize(keywords_queue)
      @flickr = FlickrrawWrapper.new
      @queue = keywords_queue
      @threads = []
      @files = []
    end

    def async_download!
      IMG_COUNT.times { @threads << Thread.new { download_image } }
      @threads.each(&:join)
      @files = @threads.map(&:value)
    end

    private

    def download_image
      file = nil
      count = 0
      loop do
        keyword = @queue.pop
        url = @flickr.get_url(keyword)
        redo if url.nil?
        file = URI.parse(url).open rescue nil
        if file.is_a?(Tempfile)
          break
        elsif count >= REDO_COUNT
          raise StandardError.new('Problem with file download')
        else
          count += 1
          redo
        end
      end
      file
    end
  end
end
