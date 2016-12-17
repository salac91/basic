require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new article" do
        expect{
          post :create, article: FactoryGirl.create(:article)
        }.to change(Article,:count).by(1)
      end
    end
    context "with invalid attributes" do
      it "does not save the new article" do
        expect{
          post :create, article: FactoryGirl.create(:article, title: nil)
        }.to_not change(Article,:count)
      end
    end

  end

  describe "DELETE destroy" do
    it "deletes the article" do
       expect{
        delete :destroy, id: FactoryGirl.create(:article)       
    } .to change(Article,:count).by(-1)
    end
  end

end
