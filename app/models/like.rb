class Like < ApplicationRecord
  belongs_to :users, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts, class_name: 'Post', foreign_key: 'post_id'

  def update_likes_counter(post_id, count)
    Post.find(post_id).update(likes_counter: count)
  end
end
