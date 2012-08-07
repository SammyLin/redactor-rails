module RedactorRails
  module Helpers
    # Setting Redactor Language
    def redactor_lang(lang = 'en')
      javascript_include_tag "redactor-rails/langs/#{lang}.js"
    end
  end
end
