
Gem::Specification.new do |s|

  s.name = 'ect'

  s.version = File.read(
    File.expand_path('../lib/ect.rb', __FILE__)
  ).match(/ VERSION *= *['"]([^'"]+)/)[1]

  s.platform = Gem::Platform::RUBY
  s.authors = [ 'John Mettraux' ]
  s.email = [ 'jmettraux@gmail.com' ]
  s.homepage = 'http://github.com/jmettraux/ect'
  s.license = 'MIT'
  s.summary = 'Methods ending in ect'

  s.description = %{
Methods ending in ect. Mostly a joke.
  }.strip

  #s.files = `git ls-files`.split("\n")
  s.files = Dir[
    'README.{md,txt}',
    'CHANGELOG.{md,txt}', 'CREDITS.{md,txt}', 'LICENSE.{md,txt}',
    'Makefile',
    'lib/**/*.rb', #'spec/**/*.rb', 'test/**/*.rb',
    "#{s.name}.gemspec",
  ]

  #s.add_runtime_dependency 'raabro', '>= 1.1.3'

  s.add_development_dependency 'rspec', '~> 3.6'

  s.require_path = 'lib'
end

