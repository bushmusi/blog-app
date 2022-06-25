require 'rails_helper'

RSpec.feature 'Post index page', type: :feature do
  before(:each) do
    User.destroy_all
    Post.destroy_all
    @user1 = User.create(name: 'user3', photo: 'user3.png', bio: 'Software developer', role: 'admin',
                         email: 'user3@yahoo.com', password: '12345678', confirmed_at: Time.now)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'This is my first post',
                         likes_counter: 0, comments_counter: 0)
    @post2 = Post.create(author: @user1, title: 'Hello', text: 'This is my second post',
                         likes_counter: 0, comments_counter: 0)
    @post3 = Post.create(author: @user1, title: 'Hello', text: 'This is my 3rd post',
                         likes_counter: 0, comments_counter: 0)
    @post3 = Post.create(author: @user1, title: 'Hello', text: 'This is my 4th post',
                         likes_counter: 0, comments_counter: 0)
    @post4 = Post.create(author: @user1, title: 'Hello', text: 'This is my 5th post',
                         likes_counter: 0, comments_counter: 0)

    5.times do |num|
      @comment = Comment.create(post: @post1, author: @user1, text: "comment#{num}")
    end

    Like.create(author: @user1, post: @post1)

    visit new_user_session_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
    visit user_posts_path(@user1.id)
  end

  describe 'Post index page' do
    it 'Shows the users photo' do
      expect(page).to have_css('.user-box')
    end

    it 'Show username to be user3' do
      expect(page).to have_content(@user1.name)
    end
    it 'show post title' do
      expect(page).to have_content(@post1.title)
    end
    it 'Should have body content' do
      expect(page).to have_content(@post1.text)
    end
    it 'Should have comment says comment1' do
      visit user_post_path(@user1.id, @post1.id)
      expect(page).to have_content('comment1')
    end
    it 'Comment and like num should exist' do
      expect(page).to have_content('Comments:')
      expect(page).to have_content('Likes')
    end
    it 'check pagination exist' do
      expect(page).to have_content('Prev')
    end
    it 'click on post should go to post page' do
      visit user_post_path(@user1.id, @post1.id)
      expect(page).to have_current_path user_post_path(@user1.id, @post1.id)
    end
  end
end
