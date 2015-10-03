class Attachment < Asset
  mount_uploader :data, AttachmentUploader

  validates_integrity_of :data
end
