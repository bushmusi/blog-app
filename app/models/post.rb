class Post < ApplicationRecord
  has_many :comments, class_name: 'comment', foreign_key: 'post_id'
  has_many :likes, class_name: 'like', foreign_key: 'post_id'
  belongs_to :user, class_name: 'user', foreign_key: 'author_id'

  # def update_counter(count, user_id)
  #   User.find(user_id).update(posts_counter: count)
  # end

  # def get_comments(post_id)
  #   Comment.find_by(post_id: post_id).limit(5)
  # end
end
