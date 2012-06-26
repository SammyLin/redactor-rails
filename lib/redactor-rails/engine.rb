module RedactorRails
  class Engine < Rails::Engine
    isolate_namespace RedactorRails
    initializer "helper" do |app|
      ActiveSupport.on_load(:action_view) do
	include RedactorRails::Helpers
      end
    end
  end
end
