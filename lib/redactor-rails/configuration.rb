module Redactor
  module Rails
    class Configuration
      class Function < String
	def encode_json(encoder)
	  self
	end
      end

      def self.defaults
	{

	}
      end

      attr_reader :options

      def initialize(options)
	@options = options
      end

      def options_for_redactor
	result = {}

	options.each do |key, value|
	  if value.is_a?(Array) && value.all? { |v| v.is_a?(String) }
	    result[key] = value.join(",")
	  elsif value.to_s.starts_with?("function(")
	    result[key] = Function.new(value)
	  else
	    result[key] = value
	  end
	end

	result
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
end
