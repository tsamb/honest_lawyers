require_relative '../spec_helper'

feature 'User sign in' do

  before { visit new_session_path }

  context "on sign in page" do
    it 'has a form' do
      page.should have_css('form')
    end
  end

  context "sign up with valid information" do
    before do
        User.create(name: 'j', email: 'blah@blah.com', password: '123456', password_confirmation: '123456' )

        fill_in "Email",        with: 'blah@blah.com'
        fill_in "Password",     with: '123456'
    end

    it "should create a user" do
      expect { click_button "Sign in" }.to change(User, :count).by(1)
    end
  end

  context "with a blank form" do
    it 'does not create a new user in the database' do
      expect { click_button "Sign in" }.not_to change(User, :count)
    end
  end

end # End feature
