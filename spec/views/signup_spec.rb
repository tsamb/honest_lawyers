require_relative '../spec_helper'

describe 'users/new.html.erb' do

  before { visit new_user_path }

  it 'should be successful' do
    response.should be_success
  end

  it 'should have form' do
    page.should have_css('form')
  end

  describe "with invalid information" do
    it 'should not allow submission of blank signup form' do
      expect { click_button "Signup" }.not_to change(User, :count)
    end
  end

  describe "wtih valid information" do
    before do
        fill_in "Name",         with: "Ju Lu"
        fill_in "Email",        with: "abc@abc.com"
        fill_in "Password",     with: "password"
        fill_in "Confirmation", with: "password"
      end

    it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
    end
  end

end #End main describe
