require 'rails_helper'

RSpec.describe Link, :type => :model do
  it "should require some fields" do
    link = Link.new
    expect(link.errors_on(:url)).not_to be_empty
    expect(link.errors_on(:date)).not_to be_empty
  end
end
