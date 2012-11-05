class RedactorRails::DocumentsController < ApplicationController
  before_filter :authenticate_user! if RedactorRails.document_model.respond_to?(:user_id)

  def index
    @documents = RedactorRails.document_model.find_all(
        RedactorRails.document_model.respond_to?(:user_id) ? { user_id: current_user.id } : { })
    render :json => @documents.to_json
  end

  def create
    @document = RedactorRails::Document.new

    file = params[:file]
    @document.data = RedactorRails::Http.normalize_param(file, request)
    @document.user = current_user if @document.respond_to?(:user)

    if @document.save
      render :text => { :filelink => @document.url, :filename => @document.filename }.to_json
    else
      render :nothing => true
    end
  end
end
