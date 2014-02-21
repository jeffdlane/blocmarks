require 'spec_helper'

describe EmailProcessor do
  describe ".process" do
    #before { Bookmark.skip_callback(:save, :before) }
    let(:email) { FactoryGirl.create(:email) }

  
    context "with email from a known address" do
      let!(:user) {FactoryGirl.create(:user, email: email.from)}
      it "verifies that a user exists and has an email address" do
        expect(user.email).to eq("mail.jeffdlane@gmail.com")
      end

      it "verifies that email from matches user email" do
        expect(email.from). to eq(user.email)
      end

      it "verifies that user is found" do
        expect(User.find_by_email(email.from).id).to eq(1)
      end

      it "processes an incoming email and creates a bookmark" do
        bm_count = Bookmark.count
        EmailProcessor.process(email)
        expect(Bookmark.count).to eq(bm_count + 1)
      end

      it "verifies that the bookmark is created for the right user" do
        bm_count = Bookmark.count
        EmailProcessor.process(email)
        expect(user.bookmarks.count).to eq(bm_count + 1)
      end

      it "creates url from email subject" do
        EmailProcessor.process(email)
        b = Bookmark.last
        expect(b.url).to eq("http://www.bacon.com")
      end

      it "creates bookmark title from email subject" do
        EmailProcessor.process(email)
        b = Bookmark.last
        expect(b.title).to eq("First Bookmark")
      end

      it "creates bookmark tags from email body" do
        EmailProcessor.process(email)
        b = Bookmark.last
        expect(b.tag_list).to eq(["bacon","waffles"])
        expect(b.tag_list.count).to eq(2)
      end
    end
  end  
end
