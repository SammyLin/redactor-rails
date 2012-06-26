module RedactorRails
  module Helpers
    def redactor(options={})
      javascript_tag { redactor_javascript(options) }
    end

    # Returns the JavaScript code required to initialize RedactorRailsjs.
    def redactor_javascript(options={})
      configuration = RedactorRails.configuration.merge(options)
      "$(document).ready(function(){$('.redactor').redactor(#{configuration.options_for_redactor.to_json});});".html_safe
    end
  end
end
