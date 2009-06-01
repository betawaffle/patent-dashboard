# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_patent-dashboard_session',
  :secret => 'f41580e8f5f8d132eaf012f92186b1adaa9092463d4c3c1ba885a3118df3835c40ae7e9a0a94e3fa75f3540e6b9a0914998ac3195d9c47ffc94d7702c4c825be'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
