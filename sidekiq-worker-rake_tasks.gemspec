$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'sidekiq/worker/rake_tasks/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'sidekiq-worker-rake_tasks'
  s.version     = Sidekiq::Worker::RakeTasks::VERSION
  s.authors     = ['Jonathon Padfield']
  s.email       = ['jonathon.padfield@gmail.com']
  s.homepage    = 'https://github.com/trammel/sidekiq-worker-rake_tasks'
  s.summary     = 'Turn sidekiq workers into rake tasks.'
  s.description = 'Turn sidekiq workers into rake tasks.'
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md'
  ]

  s.add_dependency 'sidekiq'
  s.add_dependency 'rake'
  s.add_dependency 'rails'
end
