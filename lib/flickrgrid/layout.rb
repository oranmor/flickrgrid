module Flickrgrid
  class Layout
    WIDTH  = 1920
    HEIGHT = 1080

    COLUMNS = 5
    ROWS = 3

    UNIT_WIDTH = WIDTH / COLUMNS
    UNIT_HEIGHT = HEIGHT / ROWS

    # width, height, width_offset, height_offset
    # (size in units)
    LAYOUT = [
      [1, 1, 0, 0], # 0
      [1, 1, 1, 0], # 1
      [2, 1, 2, 0], # 2
      [1, 2, 4, 0], # 3
      [2, 2, 0, 1], # 4
      [1, 1, 2, 1], # 5
      [1, 1, 3, 1], # 6
      [1, 1, 2, 2], # 7
      [1, 1, 3, 2], # 8
      [1, 1, 4, 2]  # 9
    ].freeze

    class << self
      def get_size(img_num)
        x = LAYOUT[img_num][0] * UNIT_WIDTH
        y = LAYOUT[img_num][1] * UNIT_HEIGHT
        "#{x}x#{y}"
      end

      def get_offset(img_num)
        x_off = LAYOUT[img_num][2] * UNIT_WIDTH
        y_off = LAYOUT[img_num][3] * UNIT_HEIGHT
        "+#{x_off}+#{y_off}"
      end

      def width
        WIDTH
      end

      def height
        HEIGHT
      end
    end
  end
end
