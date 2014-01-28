class EmailProcessor
  def self.process(email)
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

  # def title_processor(email_subject)
    # if email.subject.include? ","
    #   email_subject = email.subject.split(",").collect {|s| s.strip}
    #   @title = email_subject.first
    #   @url = email_subject.last
    # else
    #   @title = email.subject
    #   @url = email.subject
    # end
    # @title
    # @url
  # end


end

