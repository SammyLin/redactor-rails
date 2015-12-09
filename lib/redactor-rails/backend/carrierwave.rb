require 'mime/types'
require 'mini_magick'

module RedactorRails
  module Backend
    module CarrierWave
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.send(:extend, ClassMethods)
      end

      module ClassMethods
        def self.extended(base)
          base.class_eval do
            process :extract_content_type
            process :set_size
          end
        end
      end

      module InstanceMethods
        # process :strip
        def strip
          manipulate! do |img|
            img.strip
            img = yield(img) if block_given?
            img
          end
        end

        # process :quality => 85
        def quality(percentage)
          manipulate! do |img|
            img.quality(percentage)
            img = yield(img) if block_given?
            img
          end
        end

        def extract_content_type
          if file.content_type == 'application/octet-stream' || file.content_type.blank?
            content_type = MIME::Types.type_for(original_filename).first
          else
            content_type = file.content_type
          end

          model.data_content_type = content_type.to_s
        end

        def set_size
          model.data_file_size = file.size
        end

        def read_dimensions
          if model.image? && model.has_dimensions?
            magick = ::MiniMagick::Image.new(current_path)
            model.width, model.height = magick[:width], magick[:height]
          end
        end

      end
    end
  end
end
