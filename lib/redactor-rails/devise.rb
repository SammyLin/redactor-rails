module RedactorRails
  module Devise
    def redactor_authenticate_user!
      authenticate_user!
    end

    def redactor_current_user
      current_user
    end
  end
end