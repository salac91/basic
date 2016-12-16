require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST create" do
     context "with valid attributes" do
        it "creates a new comment" do
         expect{
           post :create, comment: FactoryGirl.create(:comment)
         }.to change(Comment,:count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not save the new comment" do
          expect{
            post :create, comment: FactoryGirl.create(:comment, body: nil)
          }.to_not change(Comment,:count)
        end
      end
   end
   
end
