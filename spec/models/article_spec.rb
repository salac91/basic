require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'article is valid' do
    expect(FactoryGirl.build_stubbed(:article)).to be_valid
  end

  it 'article with no title is invalid' do
    expect(FactoryGirl.build_stubbed(:article, title: nil)).to_not be_valid
  end

  it 'article with no description is invalid' do
    expect(FactoryGirl.build_stubbed(:article, description: nil)).to_not be_valid
  end

  it { should belong_to(:user) }

  describe "public method" do
  	let!(:article) { FactoryGirl.create(:article) }

    before  { 
    	FactoryGirl.create_list(:comment, 8, 
    	   article: article)
    }         
    context "executes method correctly" do 
      context "count_comments" do
        it "when is equal" do
          expect(article.count_comments).to eq(8)
     	end
     	it "when is not equal" do
          expect(article.count_comments).to_not eq(6)
     	end
      end
    end

  end

end
