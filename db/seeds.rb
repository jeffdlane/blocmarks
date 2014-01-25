require 'faker'
  
  5.times do
    b = Bookmark.create(title: Faker::Lorem.words(rand(3..5)).join(" "), url: Faker::Internet.url)
  end


puts "Seed finished"
puts "#{Bookmark.count} bookmarks created"