# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flickrgrid/version'

Gem::Specification.new do |spec|
  spec.name          = 'flickrgrid'
  spec.version       = Flickrgrid::VERSION
  spec.authors       = ['Denis Kurochkin']
  spec.email         = ['deniskuro@gmail.com']

  spec.summary       = 'summary'
  spec.description   = 'description'
  # spec.homepage      = "TODO: url here"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = 'flickrgrid'
  spec.require_paths = ['lib']

  spec.add_dependency 'flickraw', '0.9.9'
  spec.add_dependency 'mini_magick', '4.6.1'
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
