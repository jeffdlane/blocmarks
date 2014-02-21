require 'spec_helper'

describe BookmarksController do
  describe 'PUT #update' do
    let(:bookmark) { FactoryGirl.create(:bookmark) }

    context 'when logged in as the creator of the bookmark' do
      before { session[:user_id] = bookmark.user_id }

      it "changes bookmark's attributes" do
        put :update, id: bookmark, bookmark: FactoryGirl.attributes_for(:bookmark, title: "edited bookmark", url: "http://www.waffles.com")
        bookmark.reload
        expect(bookmark.title).to eq("edited bookmark")
        expect(bookmark.url).to eq("http://www.waffles.com")
      end
    end

    context 'when logged in a different user' do
      before { session[:user_id] = bookmark.user_id + 1 }

      it '???'
    end

    context 'when not logged in' do
      it '???'
    end
  end

  describe "GET #index" do
    it "assigns bookmarks" do
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
