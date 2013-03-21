class RedactorRails::PicturesController < ApplicationController
  before_filter :authenticate_user! if RedactorRails.picture_model.new.respond_to?(:user_id)

  def index
    @pictures = RedactorRails.picture_model.where(
        RedactorRails.picture_model.new.respond_to?(:user_id) ? { user_id: current_user.id } : { })
    render :json => @pictures.to_json
  end

  def create
    @picture = RedactorRails.picture_model.new

    file = params[:file]
    @picture.data = RedactorRails::Http.normalize_param(file, request)
    if @picture.respond_to?(:user_id)
      @picture.user = current_user
      @picture.assetable = current_user
    end

    if @picture.save
      render :text => { :filelink => @picture.url }.to_json
    else
      render :nothing => true
    end
  end
end
