require 'rails_helper'

RSpec.describe PoliticalParty, :type => :model do
  it "should require some fields" do
    political_party = PoliticalParty.new
    expect(political_party.errors_on(:name)).not_to be_empty
  end
end
