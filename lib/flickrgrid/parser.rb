require 'optparse'

module Flickrgrid
  class Parser
    attr_reader :options

    class << self
      def parse!(args)
        new(args).options
      end
    end

    def initialize(args)
      @args = args
      @args = ['-h'] if @args.nil? || @args.empty?
      @mandatory = [:output, :keywords]
      @options = {}
      parse_args
      check_mandatory
    rescue OptionParser::InvalidOption, OptionParser::MissingArgument => error
      puts error
      exit 2
    end

    private

    def parse_args
      opt_parser.parse!(@args)
      @options[:keywords] = @args.uniq
    end

    def opt_parser
      @opt_parser ||= OptionParser.new do |opt|
        opt.banner = 'Usage: flickrgrid [options] [keywords...]'
        opt.separator  ''
        opt.separator  'Options'

        opt.on('-o', '--output FILENAME', 'Output filename to store collage') do |output|
          @options[:output] = output
        end

        opt.on('-v', '--version', 'Show version') do
          puts Flickrgrid::VERSION
          exit
        end

        opt.on('-h', '--help', 'This help') do
          puts opt
          exit
        end
      end
    end

    def check_mandatory
      missing_args = @mandatory.select { |param| @options[param].nil? || @options[param].empty? }
      raise OptionParser::MissingArgument.new(missing_args.join(', ')) unless missing_args.empty?
    end
  end
end
