require 'dotenv'

# if it fails, probably this jeopardiozes production..
# TODO(ricc): take action if it fails or not.
DotEnvLoadedOk = Dotenv.load('.envrc')


Rails.application.configure do
  # 4 devise. fix when you have different for PROD/dEV
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # PROD doesnt work but SO helps: https://stackoverflow.com/questions/35683185/rails-sprocketsrailshelperassetnotprecompiled-in-development
  config.assets.check_precompiled_asset = false

  # hosts for PROD
  config.hosts << "localhost"
  config.hosts << "pastang-dev.palladi.us"
  config.hosts << "pastang.palladi.us"
  config.hosts << /pasta.*\.palladi\.us/

end

DefaultAppDescripotion = 'This is a Pasta application to teach non-italians how to associarte a certaion Pasta to a certain sauce. And,  most im portantly, how to do it WRONG'

APP_NAME = 'Pasta DoneWell'
APP_NAME_WITH_EMOJI = "🍝#{APP_NAME}"
APP_DESCRIPTION = ENV.fetch 'APP_DESCRIPTION', DefaultAppDescripotion
FANCY_APP_NAME = "#{APP_NAME_WITH_EMOJI} 💎7 (TM)"

APP_VERSION = File.read("#{Rails.root}/VERSION").chomp

# TIDO also test
ENV_EMOJI = (Rails.env == 'production' ? '🌳' : '👷‍♂️') # 🚧⚠️

# butstrap da manuale: https://github.com/twbs/bootstrap-rubygem
Rails.application.config.assets.precompile += %w(bootstrap.js popper.js)


