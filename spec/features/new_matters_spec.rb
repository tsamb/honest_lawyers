require_relative '../spec_helper'

feature 'Creating a new matter' do
  before {
    User.create(email: 'foo@foo.net', password: 'password', password_confirmation: 'password')
    visit '/users/1/matters/new'
     }
  it "should have a form" do
    page.should have_css?("form")
  end

  it "submitting a form should create a matter" do
    expect {
      # visit '/users/1/matters/new'
      # select "LexCorp", from: 'matter_Client'
      fill_in 'new_client', with: 'foohead'
      fill_in "matter[description]", with:"asdf"
      click_button "Create Matter"
    }.to change{Matter.all.count}.by(1)
  end

end
