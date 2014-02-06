FactoryGirl.define do
  factory :email, class: OpenStruct do
    subject "this is the subject"
    body "this is the body"
  end

  factory :bookmark do
    title "First Bookmark"
    url "http://www.bacon.com"
  end

end
