require 'rails_helper'

RSpec.describe 'authenticate a user', type: :feature do
  let(:user) { User.create(name: 'John', email: 'john@example.com') }

  scenario 'sign up a user' do
    user = FactoryBot.create(:user)
    visit new_user_path
    fill_in 'name_content', with: user.name
    fill_in 'email_content', with: user.email
    click_button 'Sign Up'
  end

  scenario 'login a user' do
    user = FactoryBot.create(:user)
    visit login_path
    fill_in 'name_content', with: user.name
    click_button 'Log in'
    expect(page).to have_content('New Category')
  end

  scenario 'logout a user' do
    user = FactoryBot.create(:user)
    visit login_path
    fill_in 'name_content', with: user.name
    click_button 'Log in'
    click_on 'LOGOUT'
    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign up')
  end
end
