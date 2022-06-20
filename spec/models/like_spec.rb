require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Saied', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'developer')
  post = Post.new(author: user, title: 'title', text: 'text')
  subject { Like.new(author: user, post: post) }
  before { subject }

  it 'author is nil' do
    test_case = subject
    test_case.author = nil
    expect(test_case).to_not be_valid
  end

  it 'post is nil' do
    test_case = subject
    test_case.post = nil
    expect(test_case).to_not be_valid
  end
end
