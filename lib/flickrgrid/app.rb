module Flickrgrid
  IMG_COUNT = 10

  class App
    def self.start
      new(Cli.parse!(ARGV))
    end

    def initialize(params = {})
      queue = KeywordsQueue.create(keywords: params[:keywords], dict_file: params[:dict])
      files = Downloader.get_images(queue)
    end
  end
end
