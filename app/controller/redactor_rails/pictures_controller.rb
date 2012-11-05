class RedactorRails::PicturesController < ApplicationController
  before_filter :authenticate_user! if RedactorRails.picture_model.respond_to?(:user_id)

  def index
    @pictures = RedactorRails.picture_model.find_all(
        RedactorRails.document_model.respond_to?(:user_id) ? { user_id: current_user.id } : { })
    render :json => @pictures.to_json

  end
  def create
    @picture = RedactorRails::Picture.new

    file = params[:file]
    @picture.data = RedactorRails::Http.normalize_param(file, request)
    @picture.user = current_user if @picture.respond_to?(:user)

    if @picture.save
      render :text => { :filelink => @picture.url }.to_json
    else
      render :nothing => true
    end
  end

end
