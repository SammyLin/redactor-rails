class RedactorRails::Document < RedactorRails::Asset
  mount_uploader :data, RedactorRailsDocumentUploader, :mount_on => :data_file_name

  def url_content
    url(:content)
  end

  def thumb
    # Could theoretically provide an icon set here
    # to match against the extensions
    # but for now it's nil to address the bug
    nil
  end
end
