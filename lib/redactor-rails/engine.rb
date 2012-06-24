module Redactor
  module Rails
    class Engine < ::Rails::Engine
    initializer "helper" do |app|
      ActiveSupport.on_load(:action_view) do
	include Redactor::Rails::Helpers
      end
    end
    end
  end
end
