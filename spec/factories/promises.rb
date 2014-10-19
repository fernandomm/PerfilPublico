FactoryGirl.define do
  factory :promise do
    candidate
    category
    title "MyString"
    description "MyString"
    up_votes 1
    down_votes 1
    status 'in_progress'
    date Date.today
  end

end
