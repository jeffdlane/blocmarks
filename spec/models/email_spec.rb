require 'spec_helper'

describe EmailProcessor do
  before :each do
    @email = double(:email)
    @email.stub(:subject => "First Bookmark, http://www.bacon.com")
    @email.stub(:body => "bacon, waffles")
    
  end

  it "processes an incoming email and creates a bookmark" do
    bm_count = Bookmark.count
    EmailProcessor.process(@email)
    expect(Bookmark.count).to eq(bm_count + 1)
  end

  it "creates url from email subject" do
    EmailProcessor.process(@email)
    b = Bookmark.last
    expect(b.url).to eq("http://www.bacon.com")
  end

  it "creates bookmark title from email subject" do
    EmailProcessor.process(@email)
    b = Bookmark.last
    expect(b.title).to eq("First Bookmark")
  end

  it "creates bookmark tags from email body" do
    EmailProcessor.process(@email)
    b = Bookmark.last
    expect(b.tag_list).to eq(["bacon","waffles"])
    expect(b.tag_list.count).to eq(2)
  end

end
