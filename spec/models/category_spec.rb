require 'rails_helper'

RSpec.describe Category, :type => :model do
  it "should require some fields" do
    category = Category.new
    expect(category.errors_on(:name)).not_to be_empty
  end
end
