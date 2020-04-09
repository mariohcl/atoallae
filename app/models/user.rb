class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :events, :dependent => :destroy

  acts_as_followable
  acts_as_follower

end
