require 'mini_magick'

module Flickrgrid
  class Collage
    def initialize(output_path, files)
      @images = files.map { |f| MiniMagick::Image.new(f.path) }
      @output_path = output_path
      process!
    end

    private

    def process!
      MiniMagick::Tool::Convert.new do |convert|
        convert << '-size'
        convert << "#{GridCalc::WIDTH}x#{GridCalc::HEIGHT}"
        convert << 'xc:white'
        @images.each_with_index do |img, img_index|
          size = GridCalc.get_size(img_index)
          convert << '('
          convert << img.path
          convert << '-resize'
          convert << "#{size}^"
          convert << '-extent'
          convert << size
          convert << ')'
          convert << '-geometry'
          convert << GridCalc.get_offset(img_index)
          convert << '-composite'
        end
        convert << @output_path
      end
    end
  end
end
