require 'rails_helper'

RSpec.feature 'Login Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Bushra', photo: 'bushra.png', bio: 'Software developer',
                        email: 'bush7840@yahoo.com', password: '12345678')
  end

  background { visit new_user_session_path }
  scenario 'Check input fields' do
    expect(page).to have_field('user_email')
    expect(page).to have_field('user_password')
    expect(page).to have_button('Log in')
  end

  scenario 'Empty field check' do
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'Invalid credential should return error' do
    visit new_user_session_path
    fill_in 'Email', with: 'bu@bu.com'
    fill_in 'Password', with: '123'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'Login valid credential should success' do
    visit new_user_session_path
    fill_in 'Email', with: 'bush7840@yahoo.com'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
