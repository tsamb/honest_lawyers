require_relative '../spec_helper'

describe "user creation" do

  it "should have the same name and email in db post creation" do
   user = FactoryGirl.create(:user)
   expect(User.last.name).to eq user.name
   expect(User.last.email).to eq user.email
  end

  it "should increase the total users by 3" do
    expect {
      FactoryGirl.create(:user)
      FactoryGirl.create(:user)
      FactoryGirl.create(:user)
    }.to change(User, :count).by(3)
  end

  it "should not allow creation of user without email" do
    expect {
      FactoryGirl.create(:user, email: nil)
    }.to raise_error
  end

  it "should not allow creation of user without name" do
    expect {
      FactoryGirl.create(:user, name: nil)
    }.to raise_error
  end

  it "should not allow creation of user without password" do
    expect {
      FactoryGirl.create(:user, password: nil)
    }.to raise_error
  end

  it "should not allow creation of user without password confirmation" do
    expect {
      FactoryGirl.create(:user, password_confirmation: nil)
    }.to raise_error
  end

  describe "user's matter(s)" do

    it "should allow users to have many matters" do
      expect {
        user = FactoryGirl.create(:user)
        client = FactoryGirl.create(:client)
        # matter1 = FactoryGirl.build(:matter, client_id: 1)
        # user.matters.create(FactoryGirl.build(:matter, client_id: 1))
        user.matters.create(description: 'blah', client_id: client.id, number: 1)
        user.matters.create(description: 'blah', client_id: client.id, number: 2)
        user.matters.create(description: 'blah', client_id: client.id, number: 3)
      }.to change(Matter, :count).by(3)
    end

  end

end
