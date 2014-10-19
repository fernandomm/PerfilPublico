require 'rails_helper'

feature 'Promise vote' do
  scenario 'guest should be redirected to login page' do
    candidate = FactoryGirl.create :candidate
    promise = FactoryGirl.create :promise, :candidate => candidate

    visit(vote_up_candidate_promise_path(candidate, promise))
    expect(page.current_path).to eq(new_user_session_path)

    visit(vote_down_candidate_promise_path(candidate, promise))
    expect(page.current_path).to eq(new_user_session_path)
  end

  scenario 'user should be able to vote' do
    signin

    candidate = FactoryGirl.create :candidate
    promise = FactoryGirl.create :promise, :candidate => candidate

    expect {
      visit vote_up_candidate_promise_path(candidate, promise)

      promise.reload
    }.to change(promise, :up_votes).by(1)
    
    expect(page).to have_selector('div.alert-success')
  end
end