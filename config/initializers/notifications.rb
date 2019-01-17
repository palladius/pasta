# Set our own default Notifier
module ActiveSupport::Notifications
  self.notifier = Notifier.new(Fanout.new(true))
end
