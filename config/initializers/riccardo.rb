

Rails.application.configure do
  # 4 devise. fix when you have different for PROD/dEV
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

end

APP_NAME = 'Pasta DoneWell'
APP_VERSION = File.read("#{Rails.root}/VERSION").chomp
