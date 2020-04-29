class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :stocks, :dependent => :destroy


  mount_uploader :imagen, ImagenUploader

end
