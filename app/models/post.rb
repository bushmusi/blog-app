class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :title, presence: true, length: { minimum: 4, maximum: 250 }
  validates :comments_counter, presence: true,
                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true,
                            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_counter(count, user_id)
    User.find(user_id).update(posts_counter: count)
  end

  def recent_comments
    comments.includes(:author).order('created_at desc').limit(5)
  end
end
