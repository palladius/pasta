#!/usr/bin/ruby
#
# Copyright:: Copyright 2009 Google Inc.
# Original Author:: John Woodell (mailto:woodie@google.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'fileutils'

FILE_BASE = 'http://appengine-jruby.googlecode.com/hg/demos/rails/'
MOD_FILES = %w{ app/controllers/rails/info_controller.rb
                config/application_rb config/boot.rb config/database.yml
                config/initializers/notifications.rb config_ru }
# Install Rails 3.0.pre 
FileUtils.touch 'config.ru'
system "curl -s -o Gemfile #{FILE_BASE}Gemfile"
system 'appcfg.rb bundle --update .'
# Remove dups and generate Rails app
%w{config.ru public/robots.txt}.each {|f| FileUtils.rm f }
puts "##"
puts "##  You must answer 'n' when asked to overwrite Gemfile?"
puts "##"
system 'appcfg.rb run bin/rails .'
# Fetch configuration files
FileUtils.mkdir_p 'app/controllers/rails'
MOD_FILES.each do |path|
  FileUtils.mv(path,"#{path}.orig") if File.exist? path
  system "curl -s -o #{path} #{FILE_BASE}#{path}"
end
# Merge config
system 'cat config.ru >> config_ru'
FileUtils.mv 'config_ru', 'config.ru'
# Merge configs into application.rb
system 'head -n 18 config/application.rb > conf'
system 'cat config/application_rb >> conf'
system 'tail -n 20 config/application.rb >> conf '
FileUtils.rm 'config/application_rb'
FileUtils.mv 'conf', 'config/application.rb'
puts "##"
puts "## Now type 'dev_appserver.rb .'"
puts "##"
