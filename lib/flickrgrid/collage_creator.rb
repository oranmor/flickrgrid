require 'mini_magick'

module Flickrgrid
  class CollageCreator
    def initialize(output_path, img_files, layout = Layout)
      @output_path = output_path
      @images = img_files.map { |f| MiniMagick::Image.new(f.path) }
      @layout = layout
      prepare_images!
      create!
    end

    private

    def prepare_images!
      @images.each_with_index do |img, img_index|
        img.combine_options do |b|
          size = @layout.get_size(img_index)
          b.resize "#{size}^"
          b.gravity 'center'
          b.extent size
        end
      end
    end

    def create!
      MiniMagick::Tool::Convert.new do |convert|
        convert << '-size'
        convert << "#{@layout.width}x#{@layout.height}"
        convert << 'xc:white'
        @images.each_with_index do |img, img_index|
          convert << img.path
          convert << '-geometry'
          convert << @layout.get_offset(img_index)
          convert << '-composite'
        end
        convert << @output_path
      end
    end
  end
end
