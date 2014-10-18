require 'rails_helper'

RSpec.describe Promise, :type => :model do
  it "should require some fields" do
    promise = Promise.new
    expect(promise.errors_on(:title)).not_to be_empty
    expect(promise.errors_on(:description)).not_to be_empty
    expect(promise.errors_on(:candidate_id)).not_to be_empty
    expect(promise.errors_on(:category_id)).not_to be_empty
  end
end
