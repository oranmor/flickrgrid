require 'flickraw'

module Flickrgrid
  class FlickRawWrapper
    def initialize(api_key: ENV['FLICKR_KEY'], shared_secret: ENV['FLICKR_SECRET'])
      @flickr = FlickRaw::Flickr.new(api_key: api_key, shared_secret: shared_secret)
    end

    def get_url(keyword, url_method = 'url_b')
      info = @flickr.photos.getInfo(photo_id: get_photo_id(keyword))
      FlickRaw.send(url_method, info)
    rescue StandardError
      nil
    end

    def get_photo_id(keyword)
      @flickr.photos.search(text: keyword, sort: 'interestingness-desc', per_page: 1)&.first&.id
    end
  end
end
