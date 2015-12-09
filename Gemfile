source 'https://rubygems.org'

# Specify your gem's dependencies in redactor-rails.gemspec
gemspec
gem "rails", "3.2.3"


platforms :ruby do
  gem "sqlite3"

  group :development do
    gem "unicorn", "~> 4.0.1"
  end

  group :development, :test do
    gem "capybara", ">= 0.4.0"
    gem "mynyml-redgreen", "~> 0.7.1", :require => 'redgreen'
  end

  group :active_record do
    gem "carrierwave"
    gem "mini_magick"
  end

end
