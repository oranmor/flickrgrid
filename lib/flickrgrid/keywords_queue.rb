module Flickrgrid
  class KeywordsQueue
    DEFAULT_DICT = File.dirname(__FILE__) + '/../../config/default_dict.txt'

    def self.create(keywords:, dict_path: nil)
      words = keywords || []
      dict_words = File.readlines(dict_path || DEFAULT_DICT).map(&:chomp)
      new(dict_words.shuffle + words.reverse)
    end

    def initialize(keywords = [])
      @queue = Queue.new
      keywords.reverse.each { |k| @queue.push k }
      raise StandardError.new('Not enough keywords') if @queue.length < IMG_COUNT
    end

    def pop
      raise StandardError.new('Not enough keywords') if @queue.empty?
      @queue.pop
    end
  end
end
