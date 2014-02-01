#email_processor.rb

FactoryGirl.define do
  factory :email, class: EmailProcessor do
    title "First Bookmark"
    url "http://www.bacon.com"
    tag_id 1
  end
end