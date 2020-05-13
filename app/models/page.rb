class Page < ApplicationRecord
  belongs_to :user
  has_many :events, :dependent => :destroy
  mount_uploader :image, AvatarUploader
  mount_uploader :cover, BannerUploader

  acts_as_followable

  
end
