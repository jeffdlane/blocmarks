class EmailProcessor
  def self.process(email)
    if self.authenticate(email)
      self.create_bookmark(email)
    end
  end

  def self.authenticate(email)
    User.find_by_email(email.from).present?
  end

  def self.create_bookmark(email)   
    if email.subject.include? ","
      email_subject = email.subject.split(",").collect {|s| s.strip}
      @title = email_subject.first
      @url = email_subject.last
    else
      @title = email.subject
      @url = email.subject
    end

    Bookmark.create!({ title: @title, url: @url, tag_list: email.body })    
  end

end

