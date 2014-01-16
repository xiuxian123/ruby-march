$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "march/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "march"
  s.version     = March::VERSION
  s.authors     = ["happy"]
  s.email       = ["happy@ruby1024.com"]
  s.homepage    = "http://github.com/xiuxian123/ruby-march"
  s.summary     = "Summary of March."
  s.description = "Description of March."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end
