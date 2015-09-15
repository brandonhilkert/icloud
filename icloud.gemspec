# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icloud/version'

Gem::Specification.new do |spec|
  spec.name          = "icloud"
  spec.version       = Icloud::VERSION
  spec.authors       = ["Brandon Hilkert"]
  spec.email         = ["brandonhilkert@gmail.com"]

  spec.summary       = %q{Ruby gem to authenticate to iCloud and check backup status.}
  spec.description   = %q{Ruby gem to authenticate to iCloud and check backup status.}
  spec.homepage      = "https://github.com/brandonhilkert/icloud"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"

  spec.add_dependency 'httpclient', '~> 2.3'
  spec.add_dependency 'plist', '~> 3.1'
  spec.add_dependency 'ruby-protocol-buffers', '~> 1.5.1'
end
