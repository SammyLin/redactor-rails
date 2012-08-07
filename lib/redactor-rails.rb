require "orm_adapter"
require "redactor-rails/version"

module RedactorRails
  IMAGE_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/pjpeg', 'image/tiff', 'image/x-png']

  autoload :Http, 'redactor-rails/http'

  module Backend
    autoload :CarrierWave, 'redactor-rails/backend/carrierwave'
  end
  require 'redactor-rails/orm/base'
  require 'redactor-rails/orm/active_record'
  require 'redactor-rails/engine'
  require 'redactor-rails/helper'

  mattr_accessor :image_file_types
  @@image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]


  def self.picture_model
    RedactorRails::Picture.to_adapter
  end

end
