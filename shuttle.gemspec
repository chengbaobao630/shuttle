lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shuttle/version'

Gem::Specification.new do |spec|
  spec.name = 'shuttle'
  spec.version = Shuttle::VERSION
  spec.authors = 'chcheng'
  spec.email = '554858452@qq.com'

  spec.summary = ''
  spec.description = ''
  spec.homepage = 'https://chengbaobao630@hotmail.com'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'terminal-table', '~> 1.4'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'json', '~> 1.8'
  spec.add_runtime_dependency 'activesupport', '~>4.1'
  spec.add_runtime_dependency 'i18n', '~>0.6'
  spec.add_runtime_dependency 'minitest', '~>5.1'
  spec.add_runtime_dependency 'thread_safe', '~>0.3'
  spec.add_runtime_dependency 'tzinfo', '~>1.1'
  spec.add_development_dependency 'rake', '~> 10.0'
end
