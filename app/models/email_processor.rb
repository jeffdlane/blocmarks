class EmailProcessor
  def self.process(email)
    if email.subject.include? ","
      email_subject = email.subject.split(",").strip
      @title = email_subject.first
      @url = email_subject.last
    else
      @title = email_subject
      @url = email_subject
    end
    Bookmark.create!({ title: @title, url: @url, tag_list: email.body })
  end

  # def title_processor(email_subject)
  #   if email_subject.include? ","
  #     email_subject = email_subject.split(",").strip
  #     @title = email_subject.first
  #     @url = email_subject.last
  #   else
  #     @title = email_subject
  #     @url = email_subject
  #   end
  # end


end

