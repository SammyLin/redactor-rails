class RedactorRails::DocumentsController < ApplicationController
  before_filter :redactor_authenticate_user!

  def index
    @documents = RedactorRails.document_model.where(
        RedactorRails.document_model.new.respond_to?(RedactorRails.devise_user) ? { RedactorRails.devise_user_key => redactor_current_user.id } : { })
    render :json => @documents.to_json
  end

  def create
    @document = RedactorRails.document_model.new

    file = params[:file]
    @document.data = RedactorRails::Http.normalize_param(file, request)
    if @document.has_attribute?(:"#{RedactorRails.devise_user_key}")
      @document.send("#{RedactorRails.devise_user}=", redactor_current_user)
      @document.assetable = redactor_current_user
    end

    if @document.save
      render json: { filelink: @document.url, filename: @document.filename }
    else
      render json: { error: @document.errors }
    end
  end

  private

  def redactor_authenticate_user!
    if RedactorRails.document_model.new.has_attribute?(RedactorRails.devise_user)
      super
    end
  end
end
