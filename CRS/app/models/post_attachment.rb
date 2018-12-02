class PostAttachment < ApplicationRecord
    mount_uploader :image, LensUploader
    belongs_to :rent_post
end
