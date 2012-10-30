class RedactorRails::Document < RedactorRails::Asset
  mount_uploader :data, RedactorRailsDocumentUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end
end
