class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_commit :update_comments_counter_for_post, on: :create
  validates :text, presence: true, length: { minimum: 3, maximum: 250 }
  def update_comments_counter_for_post
    post.update(comments_counter: post.comments.count)
  end
end
