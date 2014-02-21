require_relative '../spec_helper'

feature 'User sign out' do

  context "on any page" do
    it 'clears the session when clicked' do
      click_link('Sign out')
      page.should have_content 'Sign in'
      page.should have_content 'Sign out'
    end
  end

  context "on any page" do
    it 'takes you to askfhsalkjfhsad page after signing out' do
      pending
    end
  end

end # End feature
