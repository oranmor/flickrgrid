require 'flickrgrid/version'
require 'flickrgrid/parser'

module Flickrgrid
  def self.start
    params = Flickrgrid::Parser.parse!(ARGV)
  end
end
