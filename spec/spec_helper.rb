require "bundler"
Bundler.setup
Bundler.require(:default, :development)

require "rspec"
require "ssdiff"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|file| require file}

