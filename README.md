# Rails 3.2 Integration for Redactor

The redactor-rails gem integrates the [Redactor](http://redactorjs.com/) editor with the Rails 3.2 asset pipeline.

## Installation

Add this line to your application's Gemfile:

    gem 'redactor-rails'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install redactor-rails

### Now generate models for store uploading files

#### ActiveRecord + carrierwave

    gem "carrierwave"
    gem "mini_magick"

    $ rails generate redactor:install

    $ rake db:migrate
Create a `config/redactor.yml` file with your global configuration options:

      lang: 'zh_tw'
      autoresize: true

If You Want To setup a new language in Redactor you should do two things:

In you global configuration `config/redactor.yml` set option

    lang: 'zh_tw'
and

Add to your layout

    <%= redactor_lang('zh_tw') %>

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

## Special Thanks

[wildjcrt (Jerry Lee)](https://github.com/wildjcrt/)
## Statement

`redactor-rails` part of reference [galetahub/ckeditor](https://github.com/galetahub/ckeditor) project.

`redactor-rails` uses MIT-LICENSE. Rock!!!!!

## License

the `redactor-rails` project is MIT-LICENSE.

You may use `Redactor` for non-commercial websites for free, however, we do not guarantee any technical support.

Redactor has [3 different licenses](http://redactorjs.com/download/) for commercial use.
For details please see [License Agreement](http://redactorjs.com/download/).
