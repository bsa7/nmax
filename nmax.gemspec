Gem::Specification.new do |s|
  s.name = 'nmax'
  s.version = '0.1.1'

  s.authors = ['Sergio Belevskij']
  s.email = 'bbelevskij@gmail.com'

  s.date = Time.now.strftime('%Y-%m-%d')

  s.homepage = 'http://github.com/r72cccp/nmax'
  s.description = 'Reads text data from the input stream. Upon completion of the input, displays the largest integers.'
  s.summary = 'Ruby gem for parse integers from stdin'
  s.license = 'GPL-2.0'

  s.require_paths = ['lib']

  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'rake', '~> 12.3.3'

  s.files = [
    'LICENSE',
    'CHANGELOG',
    'README.md',
    'Rakefile',
    'nmax.gemspec',
    'lib/nmax.rb',
    'test/test_nmax.rb'
  ]
  s.test_files = [
    'test/test_nmax.rb'
  ]
end
