require_relative '../spec_helper'

feature 'User sign up' do

  it "page route is /signup" do
    visit "/signup"
    current_url.should have_content '/signup'
  end

  before { visit new_user_path }

  context "on sign up page" do

    it 'has a form' do
      page.should have_css('form')
    end
  end

  context "sign up with valid information" do
    before do
        fill_in "Name",         with: "Ju Lu"
        fill_in "Email",        with: "abc@abc.com"
        fill_in "Password",     with: "password"
        fill_in "Confirm password", with: "password"
      end
      it "should create a user" do
        expect { click_button "Sign up" }.to change(User, :count).by(1)
      end
  end

  context "with a blank form" do
    it 'does not create a new user in the database' do
      expect { click_button "Sign up" }.not_to change(User, :count)
    end
  end

  context "without a password confirmation" do
    it 'tells the user to enter the same password twice' do
      fill_in "Name",         with: "Ju Lu"
      fill_in "Email",        with: "abc@abc.com"
      fill_in "Password",     with: "password"

      click_button "Sign up"
      page.should have_content "Password confirmation can't be blank"
    end
  end

  context "without an email address" do

    it 'tells the user to enter a valid email address' do
      fill_in "Name",         with: "Ju Lu"
      fill_in "Password",     with: "password"
      fill_in "Confirm password", with: "password"

      click_button "Sign up"
      page.should have_content "Email can't be blank"
    end
  end
end
