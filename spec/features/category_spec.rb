require 'rails_helper'

RSpec.describe 'creating a category', type: :feature do

  scenario 'Creates a category' do
    user = FactoryBot.create(:user)
    user = FactoryBot.create(:category)
    visit new_user_path
    fill_in 'name_content', with: user.name
    fill_in 'email_content', with: "sample@gmail.com"
    click_button 'Sign Up'
    visit login_path
    fill_in 'name_content', with: user.name
    click_button 'Log in'
    expect(page).to have_content('New Category')
    click_on 'New Category'
    expect(page).to have_content('New Category')
    fill_in 'Name', with: "test category"
    fill_in 'Priority', with: 1
    click_on 'Create Category'
  end

end