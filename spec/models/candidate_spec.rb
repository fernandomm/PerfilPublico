require 'rails_helper'

RSpec.describe Candidate, :type => :model do
  it "should require some fields" do
    candidate = Candidate.new
    expect(candidate.errors_on(:name)).not_to be_empty
    expect(candidate.errors_on(:biography)).not_to be_empty
    expect(candidate.errors_on(:age)).not_to be_empty
  end

  it "should require a valid status" do
    candidate = Candidate.new :political_office => 'not valid'
    expect(candidate.errors_on(:political_office)).not_to be_empty

    candidate.political_office = 'senator'
    expect(candidate.errors_on(:political_office)).to be_empty
  end
end
