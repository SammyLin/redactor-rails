# Rails 3.2 Integration for Redactor (Devise Edition)

The redactor-rails gem integrates the [Redactor](http://redactorjs.com/) editor with the Rails 3.2 asset pipeline.

This gem bundles Redactor version 8.2.2 which is the most recent version as of January 20, 2013. Check [Redactor's changelog](http://imperavi.com/redactor/log/) for further updates.

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

    or

    $ rails generate redactor:install --devise

    # --devise option generate user_id attribute for asset(Picture, Document) models. For more details show Devise gem.
    # Now, Pictures and Documents uploading available only for signed in users
    # All uploaded files will stored with current user_id
    # User will choose only own uploaded Pictures and Documents

    $ rake db:migrate

#### Mongoid + carrierwave
    gem "carrierwave"
    gem "carrierwave-mongoid", :require => "carrierwave/mongoid"
    gem "mini_magick"

    $ rails generate redactor:install

### Include the Redactor assets

Add to your `application.js`:

      //= require redactor-rails

Add to your `application.css`:

      *= require redactor-rails

### Initialize Redactor

For each textarea that you want to use with Redactor, add the "redactor" class and ensure it has a unique ID:

    <%= text_area_tag :editor, "", :class => "redactor", :rows => 40, :cols => 120 %>

### Custom Your redactor

If you need change some config in redactor, you can

    $ rails generate redactor:config

Then generate `app\assets\redactor-rails\config.js`.

See the [Redactor Documentation](http://redactorjs.com/docs/settings/) for a full list of configuration options.


If You Want To setup a new language in Redactor you should do two things:

In you file `app\assets\redactor-rails\config.js` set option

    "lang":'zh_tw'

and

Add to your layout

    <%= redactor_lang('zh_tw') %>
    
### Defining a Devise User Model

By default redactor-rails uses the `User` model.

You may use a different model by:

1. Run a migration to update the user_id column in the 
2. Overriding the user class in an initializer.
3. Overriding the authentication helpers in your controller.

    Create a new Migration: `rails g rename_user_id_to_new_user_id`
    
    ```
    # db/migrate/...rename_user_id_to_new_user_id.rb
    
    class RenameUserIdToNewUserId < ActiveRecord::Migration
      def up
        rename_column :redactor_assets, :user_id, :admin_user_id
      end
    
      def down
        rename_column :redactor_assets, :admin_user_id, :user_id
      end
    end
    ```

    ```
    # config/redactor.rb
    # Overrides the user class
    
    module RedactorRails
      def self.devise_user
        %s(admin_user) # name of your user class
      end
      
      # You may override this to support legacy schema.
      # def self.devise_user_key
      #   "#{self.devise_user.to_s}_id".to_sym
      # end
    end
    ```
    
    ```
    # app/controllers/application_controller.rb
    
    class ApplicationController < ActionController::Base
      ...
      
      def redactor_authenticate_user!
        authenticate_admin_user! # devise before_filter
      end
    
      def redactor_current_user
        current_admin_user # devise user helper
      end
    end
    ```

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
