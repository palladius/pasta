
    # Set DataMapper to use dm-appengine adapter
    require 'dm-core'
    require 'dm-ar-finders'
    require 'dm-timestamps'
    require 'dm-validations'
    DataMapper.setup(:default, "appengine://auto")
    # Set Logger from appengine-apis, all environments
    require 'appengine-apis/logger'
    config.logger = AppEngine::Logger.new

