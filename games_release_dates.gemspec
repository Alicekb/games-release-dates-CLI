# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'games_release_dates/version'

Gem::Specification.new do |spec|
  spec.name          = "games_release_dates"
  spec.version       = GamesReleaseDates::VERSION
  spec.authors       = "Alice Balbuena"
  spec.email         = "alicekb01@gmail.com"

  spec.summary       = "List a month's game releases"
  spec.description   = "Provides the video games being released in a specified month."
  spec.homepage      = "http://rubygems.org/gems/games_release_dates-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
