class Post < ApplicationRecord

belongs_to :user
has_many :comments, :dependent => :destroy

acts_as_votable

def get_like_by_user( user_id)
  voterid = ''
  posts = Post.find(self.id).get_likes.by_type(User)
  posts.each do |v|
    if user_id == v.voter_id
      voterid = v.id
    end
  end
  return voterid
end

end
