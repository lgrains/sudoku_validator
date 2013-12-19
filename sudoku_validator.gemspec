# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sudoku_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "sudoku_validator"
  spec.version       = SudokuValidator::VERSION
  spec.authors       = ["Louise Rains"]
  spec.email         = ["lrains@berklee.edu"]
  spec.description   = %q{This gem validates Sudoku grids, complete or incomplete.}
  spec.summary       = %q{This gem validates Sudoku grids, complete or incomplete.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
end
