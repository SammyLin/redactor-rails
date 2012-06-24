# Rails 3.2 Integration for Redactor

The redactor-rails gem integrates the [Redactor](http://redactorjs.com/) editor with the Rails 3.2 asset pipeline.

## Installation

Add this line to your application's Gemfile:

    gem 'redactor-rails'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install redactor-rails

Create a `config/redactor.yml` file with your global configuration options:

      lang: 'zh_tw'
      autoresize: true

See the [Redactor Documentation](http://redactorjs.com/docs/settings/) for a full list of configuration options.

### Include the Redactor assets

Add to your `application.js`:

      //= require redactor-rails

Add to your `application.css`:

      *= require redactor-rails

### Initialize Redactor

For each textarea that you want to use with Redactor, add the "redactor" class and ensure it has a unique ID:

    <%= text_area_tag :editor, "", :class => "redactor", :rows => 40, :cols => 120 %>

Then invoke the `redactor` helper to initialize Redactor:

    <%= redactor %>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
