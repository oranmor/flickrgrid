module Flickrgrid
  IMG_COUNT = 10

  class App
    def self.start
      params = Cli.parse!(ARGV)
      new(params)
    end

    def initialize(keywords:, output_path:, dict_path: nil)
      queue = KeywordsQueue.create(keywords: keywords, dict_path: dict_path)
      images = Downloader.get_images(queue)
      CollageCreator.new(output_path, images)
    end
  end
end
