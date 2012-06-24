module Redactor
  module Rails
    module Helpers
      def redactor(options={})
	javascript_tag { redactor_javascript(options) }
      end

      # Returns the JavaScript code required to initialize Redactorjs.
      def redactor_javascript(options={})
	configuration = Rails.configuration.merge(options)
	"$(document).ready(function(){$('.redactor').redactor(#{configuration.options_for_redactor.to_json});});".html_safe
      end
    end
  end
end
