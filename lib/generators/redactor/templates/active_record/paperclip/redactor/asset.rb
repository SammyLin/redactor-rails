class RedactorRails::Asset < ActiveRecord::Base
  include RedactorRails::Orm::ActiveRecord::AssetBase
  include RedactorRails::Backend::Paperclip
end