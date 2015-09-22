lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/labeled_log/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails-labeled_log'
  spec.version       = Rails::LabeledLog::VERSION
  spec.author        = 'Prodis a.k.a. Fernando Hamasaki de Amorim'
  spec.email         = 'prodis@gmail.com'
  spec.summary       = 'A tool to use Rails Tagged Logging easily in your Ruby classes.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/prodis/rails-labeled_log'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'rails', '>= 3.2'

  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
