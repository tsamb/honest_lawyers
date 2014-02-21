require_relative '../spec_helper'

feature 'User sign in' do

  before { visit new_session_path }

  context "on sign in page" do
    it 'has a form' do
      page.should have_css('form')
      page.should have_content 'Sign in'
    end
  end

  # context "sign in with valid information" do
  #   before do
  #       fill_in "Email",        with: 'j@j.com'
  #       fill_in "Password",     with: '123456'
  #   end

  #   it "should redirect to correct page upon successful sign in" do
  #     page.should have_content 'Link to all matters.'
  #   end
  # end

  context "sign in with invalid information" do
    before do
        fill_in "Email",        with: 'ssfkhaslkfhsalkf'
        fill_in "Password",     with: 'saflwheknflsadkhf'
    end

    it "should render sign in page again" do
      click_button "Sign in"

      page.should have_content 'Sign in'
      page.should have_css('form')
    end
  end

  context "sign in with blank form" do
    it 'renders sign in page' do
      click_button "Sign in"

      page.should have_content 'Sign in'
      page.should have_content "Invalid Email or Password. Please try again."
      page.should have_css('form')
    end
  end

end # End feature
