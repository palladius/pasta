# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pasta_session',
  :secret      => '9fc51803610a0ff75806ff51601173fc66bc2196d6cb1de56a7a5ef0435797c5619ed8fa7f6f67c23ad28ab357ab9548a0d4d0a42fba634661f2415d9ef27e6c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
