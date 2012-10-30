require "orm_adapter"
require "redactor-rails/version"

module RedactorRails
  IMAGE_TYPES = ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/pjpeg', 'image/tiff', 'image/x-png']

  FILE_TYPES = ['application/msword', 'application/pdf', 'text/plain', 'text/rtf', 'application/vnd.ms-excel']

  autoload :Http, 'redactor-rails/http'

  module Backend
    autoload :CarrierWave, 'redactor-rails/backend/carrierwave'
  end
  require 'redactor-rails/orm/base'
  require 'redactor-rails/orm/active_record'
  require 'redactor-rails/orm/mongoid'
  require 'redactor-rails/engine'
  require 'redactor-rails/helper'

  mattr_accessor :image_file_types, :document_file_types
  @@image_file_types = ["jpg", "jpeg", "png", "gif", "tiff"]
  @@document_file_types = ["pdf", "doc", "docx", "xls", "xlsx", "rtf", "txt"]


  def self.picture_model
    RedactorRails::Picture.to_adapter
  end

  def self.document_model
    RedactorRails::Document.to_adapter
  end
end
