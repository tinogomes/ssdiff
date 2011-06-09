# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ssdiff/version"

Gem::Specification.new do |s|
  s.name        = "ssdiff"
  s.version     = Super::Stupid::Diff::VERSION
  s.authors     = ["tinogomes"]
  s.email       = ["tinorj@gmail.com"]
  s.homepage    = "http://github.com/tinogomes/ssdiff"
  s.summary     = %q{A Super Stupic Diff implementation}
  s.description = %q{A Super Stupic Diff implementation}

  s.rubyforge_project = "ssdiff"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "ruby-debug19" if RUBY_VERSION >= "1.9"

  s.add_development_dependency "rspec", "~> 2.6"
  s.add_development_dependency "guard-rspec"
end

