module RedactorRails
  class Configuration
    class Function < String
      def encode_json(encoder)
	self
      end
    end

    def self.defaults
      {
      	imageUpload: '/redactor_rails/pictures',
      	imageGetJson: '/redactor_rails/pictures'
      }
    end

    attr_reader :options

    def initialize(options)
      @options = options
    end


    def options_for_redactor
      options
    end

    def merge(options)
      self.class.new(self.options.merge(options))
    end

    def load(filename)
      options.merge!(YAML::load(ERB.new(IO.read(filename)).result))
    end

    def self.load(filename)
      config = new(defaults)
      config.load(filename) if File.exists?(filename)
      config
    end
  end
end
