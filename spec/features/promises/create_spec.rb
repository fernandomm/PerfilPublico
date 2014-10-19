require 'rails_helper'

feature 'Promise creation' do
  scenario 'guest should be redirected to login page' do
    candidate = FactoryGirl.create :candidate

    visit(new_candidate_promise_path(candidate))
    expect(page.current_path).to eq(new_user_session_path)
  end

  scenario 'use creates a new promise' do
    signin

    category = FactoryGirl.create :category
    candidate = FactoryGirl.create :candidate

    visit new_candidate_promise_path(candidate)
    
    select category.name, :from => 'Category'
    fill_in 'Title', :with => 'Example'
    fill_in 'Description', :with => 'Example'
    select 'Accomplished', :from => 'Status'

    expect {
      click_button 'Create'
    }.to change(Promise, :count).by(1)

    expect(page).to have_selector('div.alert-success')
  end
end