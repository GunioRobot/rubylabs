# Load the rails application
require File.expand_path('../application', __FILE__)
# Initialize the rails application
Rubylabs::Application.initialize!

# require 'flickraw'
# require 'flickr'
# require 'flickr_fu'


# Store sessions in the database instead of cookies (run rake db:sessions:create)
# -------------------------------------------------------------------------------
# config.action_controller.session_store = :active_record_store
#
# Caching stores
# --------------
# config.action_controller.cache_store = :memory_store
# config.action_controller.cache_store = :file_store, "/path/to/cache/directory"
# config.action_controller.cache_store = :drb_store, "druby://localhost:9192"
# config.action_controller.cache_store = :mem_cache_store, "localhost"
# config.action_controller.cache_store = :mem_cache_store, Memcached::Rails.new("localhost:11211")
# config.action_controller.cache_store = MyOwnStore.new("parameter")
