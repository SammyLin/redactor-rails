module RedactorRails
  module Orm
    module Base
      module AssetBase
        module InstanceMethods
          def has_dimensions?
            respond_to?(:width) && respond_to?(:height)
          end

          def image?
            RedactorRails::IMAGE_TYPES.include?(data_content_type)
          end

          def image
            url
          end

          def thumb
            url(:thumb)
          end

          def as_json_methods
            [:image, :thumb]
          end

          def as_json(options = nil)
            options = {
              :methods => as_json_methods,
              :root => false
            }

            super options
          end
        end
      end
    end
  end
end
