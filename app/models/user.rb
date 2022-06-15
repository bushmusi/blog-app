class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  def get_post(user_id)
    Post.find_by(author_id: user_id).order(created_at: :desc).limit(3)
  end
end
