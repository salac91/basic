require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :description}
  end
  
  describe "create article" do
    it 'article is valid' do
      expect(FactoryGirl.build_stubbed(:article)).to be_valid
    end
  end 

  describe "#count_comments" do
    context "article with comments" do
      it "returns positive integer" do
        article = FactoryGirl.create(:article)
        FactoryGirl.create_list(:comment, 8, 
          article: article)

        expect(article.count_comments).to eq 8
      end
    end

    context "article with no comments" do
      it "returns zero" do
        article = FactoryGirl.create(:article)

        expect(article.count_comments).to eq 0
      end
    end
  end

  describe "#author?" do
    before(:each) do
      @article = FactoryGirl.create(:article)
    end
    context "is author" do
      it "returns true" do
        current_user = @article.user

        expect(@article.author?(current_user)).to eq(true)
      end
    end

    context "is not author" do
      it "returns false" do
        current_user = FactoryGirl.create(:user, email: "zoran@gmail.com")

        expect(@article.author?(current_user)).to eq(false)
      end
    end
  end 

end
