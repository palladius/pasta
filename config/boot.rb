# replace this file with the following
require 'fileutils'
FileUtils = FileUtils::NoWrite if ENV['RAILS_ENV'].eql? 'production'
# $LOAD_PATH << 'lib'

 require 'rails'
#require "rails/core"
# EXCLUDE: active_record action_mailer active_resource
#%w(active_model action_controller action_view).each do |framework|
#  begin
#    require framework
#    require "#{framework}/rails"
#  rescue LoadError
#  end
#end
