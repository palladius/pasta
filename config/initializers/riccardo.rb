

Rails.application.configure do
  # 4 devise. fix when you have different for PROD/dEV
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # PROD doesnt work but SO helps: https://stackoverflow.com/questions/35683185/rails-sprocketsrailshelperassetnotprecompiled-in-development
  config.assets.check_precompiled_asset = false

end

APP_NAME = 'Pasta DoneWell'
APP_VERSION = File.read("#{Rails.root}/VERSION").chomp
