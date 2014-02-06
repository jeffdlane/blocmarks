require 'spec_helper'

describe BookmarksController do
  describe 'PUT #update' do
    before :each do
      @bookmark = create(:bookmark, title: "first bookmark", url: "http://www.bacon.com")
    end

    it "changes @bookmark's attributes" do
      expect(@bookmark.url).to eq("http://www.bacon.com")
      put :update, id: @bookmark,
        bookmark: attributes_for(:bookmark, title: "edited bookmark", url: "http://www.waffles.com")
        @bookmark.reload
        expect(@bookmark.title).to eq("edited bookmark")
        expect(@bookmark.url).to eq("http://www.waffles.com")
    end
  end

  describe "GET #index" do
    it "assigns @bookmarks" do
      bookmark = Bookmark.create
      get :index
        expect(assigns(:bookmarks)).to eq([bookmark])
    end
  end

  describe "POST #create" do
    it "creates a bookmark" do
      expect{
        post :create, bookmark: attributes_for(:bookmark)
      }.to change(Bookmark,:count).by(1)
    end
  end
end

