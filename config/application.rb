require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CowsAndBulls
  class Application < Rails::Application
    config.active_record.schema_format = :sql
    config.time_zone = 'Eastern Time (US & Canada)'
    config.encoding = 'utf-8'
  end
end
