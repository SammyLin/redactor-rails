class RedactorRails::DocumentsController < ApplicationController
  before_filter :redactor_authenticate_user! if RedactorRails.document_model.new.respond_to?(RedactorRails.devise_user)

  def index
    @documents = RedactorRails.document_model.where(
        RedactorRails.document_model.new.respond_to?(RedactorRails.devise_user) ? { RedactorRails.devise_user_key => redactor_current_user.id } : { })
    render :json => @documents.to_json
  end

  def create
    @document = RedactorRails::Document.new

    file = params[:file]
    @document.data = RedactorRails::Http.normalize_param(file, request)
    if @document.respond_to?(RedactorRails.devise_user)
      @document.send("#{RedactorRails.devise_user}=", redactor_current_user)
      @document.assetable = redactor_current_user
    end

    if @document.save
      render :text => { :filelink => @document.url, :filename => @document.filename }.to_json
    else
      render :nothing => true
    end
  end
end
