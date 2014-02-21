FactoryGirl.define do
  factory :email, class: OpenStruct do
    # Assumes Griddler.configure.to is :hash (default)
    to [{ full: 'mail.jeffdlane@gmail.com', email: 'mail.jeffdlane@gmail.com', token: 'mail.jeffdlane', host: 'gmail.com', name: nil }]
    from "mail.jeffdlane@gmail.com"
    subject "First Bookmark, http://www.bacon.com"
    body 'bacon, waffles'
    attachments {[]}

    trait :with_attachment do
      attachments {[
        ActionDispatch::Http::UploadedFile.new({
          filename: 'document.txt',
          type: 'image/txt',
          tempfile: File.new("#{File.expand_path File.dirname(__FILE__)}/fixtures/document.txt")
        })
      ]}
    end
  end

  factory :user do
    id 1
    email "mail.jeffdlane@gmail.com"
    password "password"
    password_confirmation "password"
  end

  factory :bookmark do
    title "First Bookmark"
    url "http://www.bacon.com"
  end

end
