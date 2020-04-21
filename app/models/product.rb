class Product < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  has_many :stocks, :dependent => :destroy

  mount_uploader :imagen, ImagenUploader

end
