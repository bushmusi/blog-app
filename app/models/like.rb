class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts

  def update_likes_counter(post_id, count)
    Post.find(post_id).update(likes_counter: count)
  end
end
