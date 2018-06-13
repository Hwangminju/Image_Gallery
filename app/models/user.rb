class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  
  # User와 Like는 1:N 관계 
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  def is_like?(post) 
    Like.find_by(user_id: self.id, post_id: post.id).present? 
  end

end