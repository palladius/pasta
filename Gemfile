##########################################################
# questo viene da una vecchia commit del Mac - da un vecchio disco - butta via nel caso
##########################################################
# # Critical default settings:
# disable_system_gems
# disable_rubygems
# bundle_path '.gems/bundler_gems'

# # List gems to bundle here:
# gem 'rails', '3.0.pre',
#      :git => 'git://github.com/rails/rails.git',
#      :ref => '1b27f5c4f72384081083fa025b6b10e5ab02ae5e'
# gem "rack", '1.0.1',
#     :git => 'git://github.com/rack/rack.git',
#     :ref => '4cc6af9b4f0b633b076f27d3a76bf86ebf9fe64e'
# gem 'i18n'
# gem 'tmail'
# gem 'rails_dm_datastore'
# gem 'activerecord-nulldb-adapter'
# #######################################
# #                                     #
# #  You should be running Rails 2.3.5  #
# #                                     #
# #  http://rails-depot.appspot.com/    #
# #                                     #
# #######################################


# NEEDS RUBY1.8!!!

# rails: 2.3.5
# hobo: i would say 0.9.106 as it coincides with rails 2.3.5 (nov 2009): https://rubygems.org/gems/hobo/versions
source 'https://rubygems.org'

#ruby "1.8.7"

gem 'rails', '2.3.18'
gem 'sqlite3'

######################################
# HOBO
######################################
# Hobo requires 1.0 to work with this pre-Neanderthal version.
# This breaks will_paginate so you need hobo's fork :/
# 
######################################
gem 'hobo', '1.0'
gem 'will_paginate', '2.3.11' # minimum required by Hobo
#gem 'hobo', :git => "git://github.com/Hobo/hobo.git"
#gem "will_paginate", :git => "git://github.com/Hobo/will_paginate.git"
######################################
##################################################
# JSON issues...
##################################################
# 20171104 JSON 1.8 required: https://stackoverflow.com/questions/21477087/why-does-passenger-says-that-my-gem-json-cant-be-found-when-my-gem-list-show
# 20171113 doesnt work: https://stackoverflow.com/questions/21095098/why-wont-bundler-install-json-gem
gem 'json'
#gem 'json', github: 'flori/json', branch: 'v1.8'
##################################################
#gem 'event-calendar'
#gem 'rdoc'
#gem "dryml", :git => "git://github.com/Hobo/hobo.git"
#gem "hobo", :git => "git://github.com/Hobo/hobo.git"
#########################################################
