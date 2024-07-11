# # This file is used by Rack-based servers to start the application.

# require_relative "config/environment"

# run Rails.application
# Rails.application.load_server


# # config.ru
# require ::File.expand_path('../config/environment', __FILE__)
# run Rails.application

# config.ru
require_relative 'config/environment'
run Rails.application
