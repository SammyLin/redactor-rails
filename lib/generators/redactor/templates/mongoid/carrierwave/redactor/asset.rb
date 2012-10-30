class RedactorRails::Asset
  include Mongoid::Document
  include Mongoid::Timestamps

  include RedactorRails::Orm::Mongoid::AssetBase

  delegate :url, :current_path, :size, :content_type, :filename, :to => :data
  validates_presence_of :data
end
