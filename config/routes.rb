RedactorRails::Engine.routes.draw do
  resources :pictures,  :only => [:index, :create]
  resources :documents, :only => [:index, :create]
end
