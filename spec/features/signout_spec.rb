require_relative '../spec_helper'

feature 'User sign out' do

  before do
    user = FactoryGirl.create(:user)

    visit new_session_path

    fill_in "Email",        with: user.email
    fill_in "Password",     with: '123456'

    click_button "Sign in"
  end

  context "on clicking signout" do
    it 'clears the session when clicked' do

      click_link('Sign out')
      page.should have_content 'Welcome to our timer page!'
    end
  end

end # End feature
