require 'rails_helper'

RSpec.describe Promise, :type => :model do
  it "should require some fields" do
    promise = Promise.new
    expect(promise.errors_on(:title)).not_to be_empty
    expect(promise.errors_on(:description)).not_to be_empty
    expect(promise.errors_on(:candidate_id)).not_to be_empty
    expect(promise.errors_on(:category_id)).not_to be_empty
  end

  it "should required a valid status" do
    promise = Promise.new :status => 'not valid'
    expect(promise.errors_on(:status)).not_to be_empty

    promise.status = 'accomplished'
    expect(promise.errors_on(:status)).to be_empty
  end
end
