class RedactorRails::PicturesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pictures = RedactorRails.picture_model.find_all(user_id: current_user.id)
    render :json => @pictures.to_json

  end
  def create
    @picture = RedactorRails::Picture.new

    file = params[:file]
    @picture.data = RedactorRails::Http.normalize_param(file, request)
    @picture.user = current_user

    if @picture.save
      render :text => { :filelink => @picture.url }.to_json
    else
      render :nothing => true
    end
  end

end
