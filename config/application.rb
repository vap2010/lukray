require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsWelcome
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :local
    config.time_zone = 'Europe/Moscow'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
        
    # config.i18n.default_locale = :de
    config.i18n.default_locale = :ru
    
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    
   config.action_mailer.delivery_method = :sendmail
   #  config.action_mailer.delivery_method = :smtp  #:sendmail
   #  config.action_mailer.smtp_settings = {
   #    :address   => 'mail.classy.ru',
   #    :port      =>  25,
   #    :domain    => 'classy.ru',      #  Если необходимо определить домен HELO, это можно сделать здесь.
   #    :user_name => 'pubus@classy.ru',
   #    :password  => 'aoedirahuuq8',
   #    :authentication => :plain,      #  Это один из символов :plain, :login, :cram_md5.
   #    :enable_starttls_auto => true  # - Установите его в false если есть проблема с сертификатом сервера, которую вы не можете решить.
   #  }
    
    ##  config.action_mailer.smtp_settings = {
    ##    address:              'smtp.gmail.com',
    ##    port:                 587,
    ##    domain:               'example.com',
    ##    user_name:            '<username>',
    ##    password:             '<password>',
    ##    authentication:       'plain',
    ##    enable_starttls_auto: true  }
    
    
  end
end
