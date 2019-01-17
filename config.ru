require 'rack/runtime'
require 'appengine-rack'
AppEngine::Rack.configure_app(
    :application => 'application-id',
    :precompilation_enabled => true,
    :version => 1)

AppEngine::Rack.app.resource_files.exclude :rails_excludes
ENV['RAILS_ENV'] = AppEngine::Rack.environment

