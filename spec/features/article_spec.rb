require 'rails_helper'
RSpec.describe 'Article', type: :feature do
  scenario 'creating valid article' do
    user = FactoryBot.create(:user)
    visit login_path
    fill_in 'name_content', with: user.name
    click_button 'Log in'
    visit new_article_path
    fill_in 'Title', with: "article.title"
    fill_in 'Text', with: "article.text"
    page.attach_file('Image', 'spec/fixtures/articl.png')
    click_on 'Create Article'
    expect(page).to have_content('Article was successfully created.')
  end
  
end