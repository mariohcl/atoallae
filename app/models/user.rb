class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts, :dependent => :destroy
  has_many :products, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  has_many :pages, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :orders

  enum role: [:admin,:visit]

  after_initialize do
    if self.new_record?
      self.role ||= :visit
    end
  end

  acts_as_followable
  acts_as_follower

  acts_as_voter

  def my_posts
    followers_id = []
    self.all_following.each do |f|
      followers_id << f.id
    end
    followers_id << id
    posts = Post.where(user_id: followers_id)
    return posts
  end

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
   end
  end

  def follow_user(user, way)
    if way == true
      self.follow(user)
    else
      self.stop_following(user)
    end
  end

end
