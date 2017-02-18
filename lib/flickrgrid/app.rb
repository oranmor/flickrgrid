module Flickrgrid
  IMG_COUNT = 10

  class App
    def self.start
      params = Cli.parse!(ARGV)
      new(params)
    end

    def initialize(keywords:, output:, dict: nil)
      queue = KeywordsQueue.create(keywords: keywords, dict_path: dict)
      images = Downloader.get_images(queue)
      CollageCreator.new(output, images)
    end
  end
end
