require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "associations" do
    it { should have_many(:articles) }
    it { should have_many(:comments) }
  end

  describe "validations" do
    it { should validate_presence_of :email}
    it { should validate_presence_of :name}
    it { should validate_presence_of :password}
  end

  describe "create user" do
	it 'user is valid' do
	  expect(FactoryGirl.build_stubbed(:user)).to be_valid
	end
  end

end
