class Product < ApplicationRecord
  belongs_to :user, :dependent => :destroy
  has_many :stocks, :dependent => :destroy
end
