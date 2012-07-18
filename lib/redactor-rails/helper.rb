module RedactorRails
  module Helpers
    def redactor(options={})
      javascript_tag { redactor_javascript(options) }
    end

    # Returns the JavaScript code required to initialize RedactorRailsjs.
    def redactor_javascript(options={})
      configuration = RedactorRails.configuration.merge(options)
      "$(document).ready(function(){$('.redactor').redactor(#{configuration.options_for_redactor.to_json});});"
    end
    # Setting Redactor Language
    def redactor_lang(lang = 'en')
      javascript_include_tag "redactor-rails/langs/#{lang}.js"
    end
  end
end
