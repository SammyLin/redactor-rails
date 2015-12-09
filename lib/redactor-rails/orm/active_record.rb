require 'redactor-rails/orm/base'

module RedactorRails
  module Orm
    module ActiveRecord
      module AssetBase
        def self.included(base)
          base.send(:include, Base::AssetBase::InstanceMethods)
          base.send(:extend, ClassMethods)
        end

        module ClassMethods
          def self.extended(base)
            base.class_eval do
              self.table_name = "redactor_assets"

              belongs_to :assetable, :polymorphic => true
              belongs_to RedactorRails.devise_user, :foreign_key => RedactorRails.devise_user_key

              if defined?(ActiveModel::ForbiddenAttributesProtection) && base.ancestors.include?(ActiveModel::ForbiddenAttributesProtection)
                # Ok
              elsif defined?(ActiveModel::MassAssignmentSecurity) && base.ancestors.include?(ActiveModel::MassAssignmentSecurity)
                attr_accessible :data, :assetable_type, :assetable_id, :assetable
              end
            end
          end
        end
      end
    end
  end
end
