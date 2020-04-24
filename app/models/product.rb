class Product < ApplicationRecord
  belongs_to :user
  has_many :stocks, :dependent => :destroy

  mount_uploader :imagen, ImagenUploader

end
