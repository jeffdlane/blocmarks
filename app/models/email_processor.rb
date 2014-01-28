class EmailProcessor
  def self.process(email)
    Bookmark.create!({ title: email.subject, url: email.body, tag_list: email.body })
  end

  def self.tags_processor(email)
    @tags = email.body.split(", ")
  end

end

