require 'rails_helper'

RSpec.feature 'Login Page', type: :feature do
  before(:each) do
    @bush = User.create(name: 'Bushra', photo: 'bushra.png', bio: 'Software developer',
                        email: 'bush7840@yahoo.com', password: '12345678')
    @lynet = User.create(name: 'user2', photo: 'user2.png', bio: 'Software developer',
                         email: 'user2@yahoo.com', password: '12345678')
    @tufahel = User.create(name: 'user3', photo: 'user3.png', bio: 'Software developer',
                           email: 'user3@yahoo.com', password: '12345678')
    visit root_path
    fill_in 'Email', with: @bush.email
    fill_in 'Password', with: @bush.password
    click_button 'Log in'
  end

  feature 'User Index Should Show all users with detail info' do
    background { visit root_path }
    scenario 'all users should be listed' do
      expect(page).to have_content('Bushra')
      expect(page).to have_content('user1')
      expect(page).to have_content('user2')
    end

    scenario 'check users image loaded' do
      expect(page.first('img')['src']).to have_content('user3.png')
      expect(page.first('img')['alt']).to have_content('user-image')
    end

    scenario 'Check post and comment are included' do
      expect(page).to have_content('Number of posts:')
    end

    scenario "When I click on a user, I am redirected to that user's show page" do
      click_link 'Bushra', match: :first
      expect(page).to have_content('See all posts')
    end
  end
end
