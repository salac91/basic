require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'comment is valid' do
    expect(FactoryGirl.build_stubbed(:comment)).to be_valid
  end

  it 'comment with no body is invalid' do
    expect(FactoryGirl.build_stubbed(:comment, body: nil)).to_not be_valid
  end

  it 'comment with no author is invalid' do
    expect(FactoryGirl.build_stubbed(:comment, author_id: nil)).to_not be_valid
  end

  it { should belong_to(:article) }
  describe "public method" do
  	let!(:comment1) { FactoryGirl.create(:comment, abuse_count: 6) }
  	let!(:user) { FactoryGirl.create(:user, email: "dule@gmail.com") }
  	let!(:article) { FactoryGirl.create(:article, user_id: user) }
  	let!(:comment2) { FactoryGirl.create(:comment, article_id: article) }

	  context "executes method correctly" do 
	      context "comment overabused?" do
	        it "when is equal" do
	          expect(comment1.overabused?).to eq(nil)
	     	end
	     	it "when is not equal" do
	          expect(comment2.overabused?).to_not eq(nil)
	     	end
	      end
	   end
   end

end
