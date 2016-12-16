require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user is valid' do
    expect(FactoryGirl.build_stubbed(:user)).to be_valid
  end

  it 'user with no email is invalid' do
    expect(FactoryGirl.build_stubbed(:user, email: nil)).to_not be_valid
  end

  it 'user with no password is invalid' do
    expect(FactoryGirl.build_stubbed(:user, password: nil)).to_not be_valid
  end
end
