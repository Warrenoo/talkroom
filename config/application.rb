require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Talkroom
  class Application < Rails::Application

    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    I18n.enforce_available_locales = false
    config.i18n.default_locale = "zh-CN"
    I18n.locale = "zh-CN"

    config.encoding = 'utf-8'
  end
end
