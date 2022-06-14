class User < ApplicationRecord
  has_many :posts, class_name: 'post', foreign_key: 'author_id'
  has_many :likes, class_name: 'like', foreign_key: 'author_id'
  has_many :comments, class_name: 'comment', foreign_key: 'author_id'

  # def get_post(user_id)
  #   Post.find_by(author_id: user_id).limit(3)
  # end
end
