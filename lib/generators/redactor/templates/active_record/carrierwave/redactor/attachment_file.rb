class RedactorRails::AttachmentFile < RedactorRails::Asset
  mount_uploader :data, RedactorRailsAttachmentFileUploader, :mount_on => :data_file_name

  def url_thumb
    @url_thumb ||= RedactorRails::Utils.filethumb(filename)
  end
end
