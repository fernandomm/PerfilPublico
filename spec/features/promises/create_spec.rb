require 'rails_helper'

feature 'Promise creation' do
  scenario 'use creates a new promise' do
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
  end
end