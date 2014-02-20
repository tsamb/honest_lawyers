require_relative '../spec_helper'

feature 'User sign in' do

  before { visit login_path }

  context "on sign in page" do
    it 'has a form' do
      page.should have_css('form')
    end
  end

  context "sign in with valid information" do
    it "takes user to the user show page" do
      fill_in "Email",        with: "harvey@sebben.com"
      fill_in "Password",     with: "password"

      click_button "Log in"

      page.should have_content "Recent matters"
      page.should have_content "Advise on personal injury suit with Superman"
      page.should have_link "All matters"
    end
  end

  context "sign in with invalid information" do
    it "displays an error and asks the user to try again" do
      fill_in "Email", with: "notauser@nowhere.com"
      fill_in "Password", with: "notapassword"

      click_button "Log in"
      page.should have_content "Log in information not recognized. Please try again."
    end
  end
end
