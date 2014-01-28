class EmailProcessor
  def self.process(email)
    Bookmark.create!({ title: email.subject, url: email.body })
  end
end