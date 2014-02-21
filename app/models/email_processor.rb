class EmailProcessor
  def self.process(email)  
    self.create_bookmark(email)
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
    self.get_user_id(email)
    Bookmark.create!({ title: @title, url: @url, user_id: @user_id, tag_list: email.body })    
  end

  def self.get_user_id(email)
    @user_id = User.find_by_email(email.from).id
    # @user_id = user.id if user
  end
end

