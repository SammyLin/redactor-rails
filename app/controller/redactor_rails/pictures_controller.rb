class RedactorRails::PicturesController < RedactorRails::ApplicationController
  def index
    authorize! :access, :redactor_rails
    @pictures = ""
    if current_user
      @pictures = RedactorRails.picture_model.find_all({ "assetable_id" => current_user.id, "assetable_type" => "User" })
    end
    render :json => @pictures.to_json
  end

  def create
    authorize! :access, :redactor_rails
    @picture = RedactorRails::Picture.new

    if current_user
      @picture.assetable = current_user
    else
      render :nothing => true and return
    end

    file = params[:file]
    @picture.data = RedactorRails::Http.normalize_param(file, request)

    if @picture.save
      render :text => { :filelink => @picture.url(:content) }.to_json
    else
      render :nothing => true
    end
  end
end
