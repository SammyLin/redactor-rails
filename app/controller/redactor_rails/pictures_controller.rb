class RedactorRails::PicturesController < RedactorRails::ApplicationController
  def index
    authorize! :access, :redactor_rails
    if current_user
      @pictures = RedactorRails.picture_model.where(["assetable_id = ? AND assetable_type = 'User'", current_user.id])
    else
      @pictures = RedactorRails.picture_model.find_all
    end
    render :json => @pictures.to_json
  end

  def create
    authorize! :access, :redactor_rails
    @picture = RedactorRails::Picture.new

    file = params[:file]
    @picture.data = RedactorRails::Http.normalize_param(file, request)

    if current_user
      @picture.assetable = current_user
    end

    if @picture.save
      render :text => { :filelink => @picture.url(:content) }.to_json
    else
      render :nothing => true
    end
  end
end
