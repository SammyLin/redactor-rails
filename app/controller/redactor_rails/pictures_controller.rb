class RedactorRails::PicturesController < ApplicationController
  def index
    #@pictures = RedactorRails.picture_model.find_all.map {|picture| {"thumb" => picture.url_thumb, "image" => picture.url} }
    @pictures = RedactorRails.picture_model.find_all
    render :json => @pictures.to_json

  end
  def create
    @picture = RedactorRails::Picture.new

    file = params[:file]
    @picture.data = RedactorRails::Http.normalize_param(file, request)

    if @picture.save
      render :text => "<img src=#{@picture.url}/>"
    else
      render :nothing => true
    end
  end

end
