class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_counter(count, user_id)
    User.find(user_id).update(posts_counter: count)
  end

  def recent_comments
    comments.includes(:author).order('created_at desc').limit(5)
  end
end
