require 'rails_helper'

RSpec.describe Candidate, :type => :model do
  it "should require some fields" do
    candidate = Candidate.new
    expect(candidate.errors_on(:name)).not_to be_empty
    expect(candidate.errors_on(:biography)).not_to be_empty
    expect(candidate.errors_on(:age)).not_to be_empty
  end
end
