# -*- encoding: utf-8 -*-
require File.expand_path('../lib/simple_metrics/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Frederik Dietz"]
  gem.email         = ["fdietz@gmail.com"]
  gem.description   = %q{Simple Metrics Ruby Client}
  gem.summary       = %q{Simple Metrics Ruby Client}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "simple_metrics_client"
  gem.require_paths = ["lib"]
  gem.version       = SimpleMetrics::VERSION

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rr"

end
