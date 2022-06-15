class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User'

  def update_counter(count, user_id)
    User.find(user_id).update(posts_counter: count)
  end

  def get_comments(post_id)
    Comment.find_by(post_id: post_id).limit(5)
  end
end
