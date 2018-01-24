class RedactorRails::Document < RedactorRails::Asset
  has_attached_file :data,
                    url: "/redactor_rails/attachments/:id/:filename",
                    path: ":rails_root/public/redactor_rails/attachments/:id/:filename"

  validates_attachment_size :data, less_than: 100.megabytes
  validates_attachment_presence :data

  def url_content
    url(:content)
  end

  def as_json_methods
    [:image]
  end

end