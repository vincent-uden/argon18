Gem::Specification.new do |s|
  s.name = 'argon18'
  s.version = '0.1.2'
  s.executables << 'argon18'
  s.date = '2019-11-30'
  s.summary = "Argon 18 ⚛️"
  s.description = "A tiny webserver for demo projects"
  s.authors = ["Vincent Udén"]
  s.email = 'vincentuden@gmail.com'
  s.files = ["lib/argon18.rb", "lib/server/app.rb"]
  s.homepage = "https://rubygems.org/gems/argon18"
  s.license = "MIT"

  s.add_runtime_dependency 'sinatra', '~> 2.0', '>= 2.0.4'
  s.add_runtime_dependency 'slim', '~> 4.0', '>= 4.0.1'
end
