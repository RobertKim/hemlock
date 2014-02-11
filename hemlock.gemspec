# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','hemlock','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'hemlock'
  s.version = Hemlock::VERSION
  s.author = 'Nicholas Shook'
  s.email = 'nicholas.shook@gmail.com'
  s.homepage = 'https://github.com/shicholas/hemlock'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Memorization through written repetition - Socrates is not amused'
  s.files = `git ls-files`.split("\n")
  s.require_paths << 'lib' << 'flashcards'
  s.bindir = 'bin'
  s.executables << 'hemlock'
  s.add_development_dependency('guard-rspec')
  s.add_runtime_dependency('gli','2.9.0')
  s.add_runtime_dependency('rainbow', '1.99.1')
end
