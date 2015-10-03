class Attachment < Asset
  mount_uploader :data, AttachmentUploader

  validates_integrity_of :data
  validates_filesize_of :data, maximum: 5.megabytes.to_i
end
