require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "associations" do 
    it { should belong_to(:article) }
    it { should belong_to(:user) }
  end 

  describe "validations" do
    it { should validate_presence_of :body}
    it { should validate_presence_of :user_id}
  end

  describe "create comment" do
    it 'comment is valid' do
      expect(FactoryGirl.build_stubbed(:comment)).to be_valid
    end
  end

  describe "#abuse!" do
    context "comment updated correctly" do
      it "returns true and abuse_count incremented" do
        comment = FactoryGirl.create(:comment)

        expect(comment.abuse_count).to eq 0
        expect(comment.abuse!).to eq(true)
        expect(comment.abuse_count).to eq 1
      end
    end
  end

  describe "#overabused?" do
    context "comment is overabused" do
      it "remove comment" do
        comment = FactoryGirl.create(:comment, abuse_count: 4)
        comment.overabused?
       
        expect(Comment.where(id: comment.id)).to_not exist
      end
    end

    context "comment is not overabused" do
      it "maintain comment" do
        comment = FactoryGirl.create(:comment, abuse_count: 1)
        comment.overabused?
       
        expect(Comment.where(id: comment.id)).to exist
      end
    end
  end

  describe "#author?" do
    context "is author" do
      it "returns true" do
        comment = FactoryGirl.create(:comment)
        current_user = comment.user

        expect(comment.author?(current_user)).to eq(true)
      end
    end

    context "is not author" do
      it "returns false" do
        comment = FactoryGirl.create(:comment)
        current_user = FactoryGirl.create(:user, email: "pera@gmail.com")

        expect(comment.author?(current_user)).to eq(false)
      end
    end
  end 

end
