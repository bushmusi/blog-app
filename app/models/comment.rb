class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts, class_name: 'Post', foreign_key: 'post_id'

  def update_counter(post_id, count)
    Post.find(post_id).update(comments_counter: count)
  end
end
