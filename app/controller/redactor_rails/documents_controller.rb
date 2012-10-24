class RedactorRails::DocumentsController < ApplicationController
  def index
    @documents = RedactorRails.document_model.find_all({})
    render :json => @documents.to_json
  end

  def create
    @document = RedactorRails::Document.new

    file = params[:file]
    @document.data = RedactorRails::Http.normalize_param(file, request)

    if @document.save
      render :text => { :filelink => @document.url, :filename => @document.filename }.to_json
    else
      render :nothing => true
    end
  end
end
