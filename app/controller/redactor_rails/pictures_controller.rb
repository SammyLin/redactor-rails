class RedactorRails::PicturesController < ApplicationController
  def index
    @pictures = RedactorRails.picture_model.find_all
    render :json => @pictures.to_json

  end
  def create
    @picture = RedactorRails::Picture.new

    file = params[:file]
    @picture.data = RedactorRails::Http.normalize_param(file, request)

    if @picture.save
      render :text => { :filelink => @picture.url }.to_json
    else
      render :nothing => true
    end
  end

end
