FactoryGirl.define do
  factory :candidate do
    political_party
    name "MyString"
    age 20
    biography "MyText"
    political_office 'senator'
  end

end
