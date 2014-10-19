require 'rails_helper'

feature 'Promise show' do
  scenario 'should show promise data' do
    candidate = FactoryGirl.create :candidate
    promise = FactoryGirl.create :promise, :candidate => candidate

    visit(candidate_promise_path(candidate, promise))
    expect(page).to have_content(promise.title)
  end
end