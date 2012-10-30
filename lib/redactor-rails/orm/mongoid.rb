require 'redactor-rails/orm/base'

module RedactorRails
  module Orm
    module Mongoid
      module AssetBase
        def self.included(base)
          base.send(:include, Base::AssetBase::InstanceMethods)
          base.send(:extend, ClassMethods)
        end

        module ClassMethods
          def self.extended(base)
            base.class_eval do
              store_in :collection => 'redactor_assets'

              belongs_to :assetable, :polymorphic => true

              field :data_file_name, :type => String
              field :data_content_type, :type => String
              field :data_file_size, :type => Integer

              field :type, :type => String

              field :width, :type => Integer
              field :height, :type => Integer

              index( :assetable => 1, :type => 1 )
              index( :assetable => 1 )

            end
          end
        end
      end
    end
  end
end
