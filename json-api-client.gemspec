# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_api_client/version'

Gem::Specification.new do |spec|
  spec.name          = "json-api-client"
  spec.version       = JsonApiClient::VERSION
  spec.authors       = ["John Bohn"]
  spec.email         = ["jjbohn@gmail.com"]
  spec.summary       = %q{A client for working with json api spec based apis}
  spec.description   = %q{A client for working with json api spec based apis}
  spec.homepage      = "https://www.github.com/jjbohn/json-api-spec"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "activesupport"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
end
