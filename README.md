# Flickrgrid

## About

Flickrgrid is a ruby command line tool that:

  * accepts a list of search keywords as arguments
  * queries the Flickr API for the top-rated image for each keyword
  * downloads the results
  * crops them rectangularly
  * assembles a collage grid from ten images and
  * writes the result to a user-supplied filename

If given less than ten keywords, or if any keyword fails to
result in a match, it retrieves random words from a dictionary
source.

## Installation

* Install [ImageMagick](http://www.imagemagick.org/).
* Obtain flickr API key from https://www.flickr.com/services/apps/create/apply/
* Export them as environment variables
```bash
export FLICKR_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
export FLICKR_SECRET=xxxxxxxxxxxxxxxx
```
* Clone and build gem
```bash
git clone https://github.com/oranmor/flickrgrid.git
cd flickrgrid
gem build ./flickrgrid.gemspec
gem install ./flickrgrid-0.1.0.gem
```

## Usage example
```bash
flickrgrid -o output.jpg strawberry kiwi cherry limes
```

Command line help:

```bash
flickrgrid -h
```

From ruby console:
```ruby
require 'flickrgrid'
Flickrgrid::App.new(keywords: %w(test music kiwi), output: 'test.jpg')
````

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
