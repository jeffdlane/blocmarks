class EmailProcessor
  def self.process(email)
    if self.authenticate(email)
      puts "authentication succeeded"
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
    @user_id = User.find_by_email(email.from).id
    Bookmark.create!({ title: @title, url: @url, user_id: @user_id, tag_list: email.body })    
  end

end

