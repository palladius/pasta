

Rails.application.configure do
  # 4 devise. fix when you have different for PROD/dEV
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # PROD doesnt work but SO helps: https://stackoverflow.com/questions/35683185/rails-sprocketsrailshelperassetnotprecompiled-in-development
  config.assets.check_precompiled_asset = false


end

APP_NAME = 'Pasta DoneWell'
FANCY_APP_NAME = '🍝 Pasta DoneWell 💎7 (TM)'

APP_VERSION = File.read("#{Rails.root}/VERSION").chomp

# TIDO also test
ENV_EMOJI = (Rails.env == 'production' ? '🌳' : '⚠️')

# butstrap da manuale: https://github.com/twbs/bootstrap-rubygem
Rails.application.config.assets.precompile += %w(bootstrap.js popper.js)
