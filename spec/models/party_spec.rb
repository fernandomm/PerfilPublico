require 'rails_helper'

RSpec.describe Party, :type => :model do
  it "should require some fields" do
    party = Party.new
    expect(party.errors_on(:name)).not_to be_empty
  end
end
