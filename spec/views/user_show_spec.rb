require 'rails_helper'

RSpec.feature 'Testing user show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user1 = User.create(name: 'user3', photo: 'user3.png', bio: 'Software developer', role: 'admin',
                         email: 'user3@yahoo.com', password: '12345678', confirmed_at: Time.now)
    visit root_path
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log in'
  end

  after(:each) do
    User.destroy_all
  end
  background { visit user_path(@user1.id) }

  scenario 'User1 should be loadded' do
    expect(page).to have_content('user3')
  end

  scenario 'Users profile picture check' do
    expect(page.first('img')['src']).to have_content('user3.png')
  end
  scenario "I can see the user's bio" do
    expect(page).to have_content('Software developer')
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    click_link('See all posts')
    expect(current_path).to eq user_posts_path(User.first.id)
  end
end
