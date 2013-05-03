# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'obo/version'

Gem::Specification.new do |s|
  s.name = "obo"
  s.version = Obo::VERSION
  s.authors = ["Robert Syme", "Darren Oakley"]
  s.email = ["rob.syme@gmail.com", "daz.oakley@gmail.com"]
  s.description = "The OBO format is the text file format used by OBO-Edit, the open-source, platform-independent application for viewing and editing ontologies. The format is described here: http://www.geneontology.org/GO.format.obo-1_2.shtml"
  s.summary = "A parser for the OBO flat file format"
  s.homepage = "http://github.com/robsyme/obo"
  s.licenses = ["MIT"]

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
end

