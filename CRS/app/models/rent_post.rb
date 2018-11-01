class RentPost < ApplicationRecord
    resourcify
    belongs_to :user
    validates :user, presence: true
    
    mount_uploader :image, LensUploader
 
    # 이미지를 가진 게시글 삭제 시 AWS S3서버에도 자동 삭제처리
    before_destroy :destroy_assets
 
    def destroy_assets
        self.image.remove! if self.image
        self.save!
    end
    
    
        
end
